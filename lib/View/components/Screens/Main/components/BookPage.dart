import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';

import 'package:flutter_library_new/models/BookModel.dart';

import '../../../components.dart';
import 'package:flutter/cupertino.dart';

class OnebookWidget extends StatelessWidget {
  @required final BookModel bookModel;
  @required final double numberOfbook;

  const OnebookWidget(
      {Key key, @required this.bookModel, this.numberOfbook: 1.8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double width11 = queryData.size.width;
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
            child: SizedBox(
              width: width11 / numberOfbook,
              child: Card(
                  elevation: 20,
                  child: Column(
                    children: [
                      SizedBox(
                        width: width11 / numberOfbook,
                        height: 200,
                        child: Image.network(
                            bookModel.imageUrl
                      ),
                      ),
                      SizedBox(height: 10),
                      SubText(text: bookModel.bookName),
                      SizedBox(height: 10),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
