import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';
import 'package:flutter_library_new/controller/authors_controller.dart';
import 'package:flutter_library_new/models/AuthorModel.dart';
import '../BookInfo/BookPage.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';

import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';


/// SHOW INFORMATIONS AND BOOKS FOR ONE AUTHOR
class AuthorInformation extends StatelessWidget {
  BookInfoController _con1 = BookInfoController();
  final String authorId ;

   AuthorInformation({Key key, this.authorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar11(context),
        body: SingleChildScrollView(
            child: Column(
          children: [
            AuthorInfoHeader(authorId: authorId,),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  FutureBuilder(
                    future: _con1.fetchSimilarBooks(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<BookModel> list = snapshot.data;
                        return Container(
                          height: double.maxFinite,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),

                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return onBookWidget(
                                    bookModel: list[index], numberOfbook: 1);
                              }),
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error");
                      }

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
          ],
        )),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

class AuthorInfoHeader extends StatelessWidget {
   AuthorInfoHeader({
    Key key, this.authorId,
  }) : super(key: key);
  AuthorController   _con2 = AuthorController();
  final String authorId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _con2.fetchAuthorInformation(authorId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<AuthorModel> list = snapshot.data;
          return Center(
            child: SizedBox(
              width: double.infinity,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 250,
                      child: BookImage(imageUrl: " ",imageHeight: 150,),
                    ),
                    SizedBox(height: 10),
                    SubText(text: list[0].authorName, textSize: 24),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SubText(
                            text:list[0].bio,
                            textSize: 14,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
