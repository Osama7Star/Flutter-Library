import 'package:flutter/material.dart';
import 'package:flutter_library_new/models/ReadingBooksModel.dart';

class readingBookTextW extends StatelessWidget {
  const readingBookTextW({
    Key key,
    @required this.readingBooksModel,
  }) : super(key: key);

  final ReadingBooksModel readingBooksModel;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        RichText(
          text: TextSpan(
              text: 'بدء',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal,

              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' [ ${readingBooksModel.fullName} ]',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '  \n بقراءة كتاب  \n',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: '[ ${readingBooksModel.bookName} ] ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,

                      fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ],
    );
  }
}