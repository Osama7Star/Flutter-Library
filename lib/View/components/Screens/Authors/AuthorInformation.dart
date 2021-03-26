import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';
import 'package:flutter_library_new/View/components/Screens/Main/components/BookPage.dart';

import 'package:flutter_library_new/models/BookModel.dart';

import '../../components.dart';

class AuthorInformation extends StatelessWidget {
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
                  ...List.generate(
                      bookDemo.length,
                      (index) => OnebookWidget(
                          bookModel: bookDemo[index], numberOfbook: 1))
                ],
              ),
            ),
          ],
        )));
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
                child: BookImage(imageUrl: " "),
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
