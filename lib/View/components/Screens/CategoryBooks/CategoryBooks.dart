import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/Main/components/BookPage.dart';
import '../../components.dart';
import 'package:flutter_library_new/models/BookModel.dart';

class CategoryBooks11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar11(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
        SizedBox(
          width: double.infinity,
          child: Card(
          child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SubText(text: "روايات"),

    )),
        ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  ...List.generate(bookDemo.length,
                          (index) => OnebookWidget(bookModel: bookDemo[index],numberOfbook:1))
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
