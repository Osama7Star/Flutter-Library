import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';

import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/route_argument.dart';

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


      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                BookInfo.routeName,
                arguments: RouteArgument(id: "10") ,
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
                        height: 100,
                        // TODO : CORRECT SOME IMAGES URL
                        child: Image.network(
                            bookModel.imageUrl
                      ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 55,
                          child: SubText(text: bookModel.bookName)),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
