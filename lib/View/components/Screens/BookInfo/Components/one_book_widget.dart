import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Book_Info_Screen.dart';

import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/route_argument.dart';
import 'package:flutter_library_new/utilites/ScreenArguments.dart';
import 'package:flutter_library_new/utilites/SizeConfig.dart';

import '../../../components.dart';
import 'package:flutter/cupertino.dart';

/// THIS WIDGET SHOWS Brief information ABOUT BOOK (IMAGE AND NAME )
class OneBookWidget extends StatelessWidget {
  @required
  final BookModel bookModel;
  @required
  final double numberOfbook;

  const OneBookWidget(
      {Key key, @required this.bookModel, this.numberOfbook: 1.8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widgetHeight = getWidgetHeight(2.3);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookInfo(
                  bookId: bookModel.bookId,
                  categoryId: bookModel.categoryId,
                ),
              ),
            );
          },
          child: SizedBox(
            height: widgetHeight,
            width: getScreenWidth() / numberOfbook,
            child: AspectRatio(
              aspectRatio: numberOfbook==1 ? 1 /5:1,

              child: Card(
                  elevation: 20,
                  child: Column(
                    children: [
                      SizedBox(
                        ///TODO: ADD PLACEHOLDER
                          height: widgetHeight / 1.35,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                               image: NetworkImage(bookModel.imageUrl),
                                fit: BoxFit.fill,
                              ),

                            ),
                          )),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SubText(text: bookModel.bookName),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
