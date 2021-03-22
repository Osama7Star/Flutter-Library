import 'package:flutter/material.dart';
import 'package:flutter_library_new/Screens/BookInfo/BookInfo.dart';
import 'package:flutter_library_new/components/components.dart';
import 'package:flutter_library_new/models/BookModel.dart';

class OnebookWidget extends StatelessWidget {
  final BookModel bookModel;

  const OnebookWidget({Key key, @required this.bookModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookInfo()),
        );
        print('test');
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookInfo()),
              );
            },
            child: Card(
                elevation: 20,
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.network(
                          "https://cdn02.plentymarkets.com/4n91gk7bomyj/item/images/124582293/full/--------------------------------------------------------------------------01.jpg"),
                    ),
                    SizedBox(height: 10),
                    SubText(text: bookModel.bookName)
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
