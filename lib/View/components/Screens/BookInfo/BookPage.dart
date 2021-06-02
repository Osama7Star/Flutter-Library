import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Book_Info_Screen.dart';

import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/route_argument.dart';
import 'package:flutter_library_new/utilites/ScreenArguments.dart';

import '../../components.dart';
import 'package:flutter/cupertino.dart';

/// THIS WIDGET SHOWS Brief information ABOUT BOOK (IMAGE AND NAME )
class onBookWidget extends StatelessWidget {
  @required final BookModel bookModel;
  @required final double numberOfbook;

  const onBookWidget(
      {Key key, @required this.bookModel, this.numberOfbook: 1.8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double width11 = queryData.size.width;
    return GestureDetector(
      onTap: () {


      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(

                  builder: (context) => BookInfo(bookId:bookModel.bookId,categoryId:bookModel.categoryId ,),
                ),
              );
            },
            child: SizedBox(
              width: width11 / numberOfbook,
              child: Card(
                  elevation: 20,
                  child: Column(
                    children: [
                      SizedBox(
                        width: width11 / numberOfbook,
                        height: 250,
                        // TODO : CORRECT SOME IMAGES URL
                        child: FadeInImage(image: NetworkImage(bookModel.imageUrl), placeholder: AssetImage("assets/images/default-book.png")),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: SizedBox(
                          height: 55,
                            child: SubText(text: bookModel.bookName)),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
