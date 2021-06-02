import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';

import '../Book_Info_Screen.dart';
import 'book_detail.dart';


class GetBookInfoW extends StatelessWidget {
  const GetBookInfoW({
    Key key,
    @required BookInfoController con1,
    @required this.bookId,
  })  : _con1 = con1,
        super(key: key);

  final String bookId;
  final BookInfoController _con1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _con1.fetchBookById(bookId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<BookModel> list = snapshot.data;

          return BookDetailsW(bookModel: list[0]);
        } else if (snapshot.hasError) {
          return Text("Error");
        }

        // By default, show a loading spinner.
        return SizedBox(height: 200, child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator()
          ],
        ));
      },
    );
  }
}
