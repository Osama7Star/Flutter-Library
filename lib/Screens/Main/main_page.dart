import 'package:flutter/material.dart';
import 'package:flutter_library_new/components/components.dart';
import 'package:flutter_library_new/models/BookModel.dart';

import 'components/BookPage.dart';
import 'components/CategoryNameLabel.dart';
import 'components/slider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _MainPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar11(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: missing_required_param
            Slider222(),
            SizedBox(height: 10),
            // Category(),
            CategoryNameLabel(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(bookDemo.length,
                      (index) => OnebookWidget(bookModel: bookDemo[index]))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
