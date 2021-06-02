import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Book_Info_Screen.dart';
import 'package:flutter_library_new/View/components/Screens/Category/category.dart';
import 'package:flutter_library_new/View/components/Screens/SuggestBook/suggest_book.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/login/login.dart';

import '../../../components.dart';

class BookNotFound extends StatelessWidget {
  final String text;

  const BookNotFound({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SubText(text: text),
            SizedBox(height: 20),
            Button(
                text: 'إقتراح',
                pressed: () {
                  Navigator.of(context).pushNamed(SuggestBook.routeName);
                })
          ],
        ),
      ),
    );
  }
}
