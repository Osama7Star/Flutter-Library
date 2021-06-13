import 'package:flutter/material.dart';
import 'package:flutter_library_new/models/BookModel.dart';

import '../../BookInfo/Components/one_book_widget.dart';
class getBooksW extends StatelessWidget {


  final Future<dynamic> function ;

  const getBooksW({Key key, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: function,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<BookModel> list = snapshot.data;
          return SizedBox(

            child: Container(
              child: GridView.count(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 4.8 / 9.0,
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: MediaQuery.of(context).orientation ==
                      Orientation.portrait
                      ? 2
                      : 4,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(list.length, (index) {
                    return OneBookWidget(bookModel: list[index]);
                  })),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}