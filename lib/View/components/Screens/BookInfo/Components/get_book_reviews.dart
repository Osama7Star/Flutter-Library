import 'package:flutter/material.dart';
import 'package:flutter_library_new/models/BookReviewsModel.dart';

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
        padding: const EdgeInsets.all(8.0),
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
                        return BookReviews1(
                          bookReviews: list[index],
                        );
                      });
                } else {
                  Text('Nothing');
                }
              } else if (snapshot.hasError) {
                return Text("Error");
              }

              // By default, show a loading spinner.
              return Text('');
            },
          ),
        ),
      ),
    );
  }
}
