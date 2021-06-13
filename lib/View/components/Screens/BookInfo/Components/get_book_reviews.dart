import 'package:flutter/material.dart';
import 'package:flutter_library_new/models/BookReviewsModel.dart';

import '../../../components.dart';
import '../Book_Info_Screen.dart';
import 'components.dart';

class GetBookReviewW extends StatelessWidget {
  final Future<dynamic> function;

  final String bookId;

  const GetBookReviewW({Key key, this.function, this.bookId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookInfo(bookId: bookId),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 350),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: function,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<BookReviewsModel> list = snapshot.data;
                if (list.length > 0) {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return snapshot.data.length > 0
                            ? BookReviews1(
                                bookReviews: list[index],
                              )
                            : Text("No things");
                      });
                } else {
                  Text('Nothing');
                }
              } else if (snapshot.hasError) {
                return Text("Error");
              }

              // By default, show a loading spinner.
              return SubText(text:"لا يوجد مراجعات حتى الان");
            },
          ),
        ),
      ),
    );
  }
}
