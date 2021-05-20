import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';
import '../BookInfo/BookPage.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';

import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';


/// SHOW INFORMATIONS AND BOOKS FOR ONE AUTHOR
class AuthorInformation extends StatelessWidget {
  BookInfoController _con1 = BookInfoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar11(context),
        body: SingleChildScrollView(
            child: Column(
          children: [
            AuthorInfoHeader(),
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
  const AuthorInfoHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              SubText(text: "عبد الوهاب المسيري", textSize: 24),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SubText(
                      text:
                          "عبد الوهاب محمد المسيري (أكتوبر 1938 - 3 يوليو 2008)، مفكر وعالم اجتماع مصري مسلم، وهو مؤلف موسوعة اليهود واليهودية والصهيونية أحد أكبر الأعمال الموسوعية العربية في القرن العشرين. الذي استطاع من خلالها برأي البعض إعطاء نظرة جديدة موسوعية موضوعية علمية للظاهرة اليهودية بشكل خاص، وتجربة الحداثة الغربية بشكل عام، مستخدماً ما طوره أثناء حياته الأكاديمية من تطوير مفهوم النماذج التفسيرية، أما برأي البعض الآخر فقد كانت رؤيته في موسوعته متحيزة لليهود، ومتعاطفة إلى حد كبير مع مواقفهم تجاه غير اليهود، بل وصفها البعض بأنها تدافع عن اليهود.",
                      textSize: 14,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
