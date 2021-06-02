import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';

import 'BookPage.dart';

class GetSimilarBooksW extends StatelessWidget {
  const GetSimilarBooksW({
    Key key,
    @required BookInfoController con1,
    this.categoryId,
  })  : _con1 = con1,
        super(key: key);

  final BookInfoController _con1;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _con1.fetchSimilarBooks(categoryId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<BookModel> list = snapshot.data;
          return SizedBox(
            height: 350,
            child: Container(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return onBookWidget(bookModel: list[index]);
                  }),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error");
        }

        // By default, show a loading spinner.
        return SizedBox(height: 350, child: Column(
          children: [
            CircularProgressIndicator()
          ],
        ));
      },
    );
  }
}
