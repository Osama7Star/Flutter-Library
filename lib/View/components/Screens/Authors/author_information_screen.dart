import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Book_Info_Screen.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Components/components.dart';
import 'package:flutter_library_new/controller/authors_controller.dart';
import 'package:flutter_library_new/models/AuthorModel.dart';
import '../BookInfo/Components/one_book_widget.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';

import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'Components/author_info_header.dart';


/// SHOW AUTHOR INFORMATION (NAME IMAGE BIO  )
/// AND ALL BOOKS FOR ONE AUTHOR
class AuthorInformationScreen extends StatelessWidget {
  BookInfoController _con1 = BookInfoController();
  AuthorController   _con2 = AuthorController();
  final String authorId ;

   AuthorInformationScreen({Key key, this.authorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(context),
        body: SingleChildScrollView(
            child: Column(
          children: [
            AuthorInfoHeader(authorId: authorId,),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(

                children: [
                  FutureBuilder(
                    future: _con2.fetchAuthorBooks(authorId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<BookModel> list = snapshot.data;
                        return Column(
                          children: [
                            SizedBox(height: 10),

                            booksNumbersW(booksNumbers: list.length),

                            SizedBox(height: 10),

                            Container(
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),

                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return OneBookWidget(
                                        bookModel: list[index], numberOfbook: 1);
                                  }),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error");
                      }

                      // By default, show a loading spinner.
                      return SizedBox(
                        height: 3000,
                        child: Container(
                          child: Align(
                              alignment: AlignmentDirectional.center,
                              child: CircularProgressIndicator()),
                        ),
                      );
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

