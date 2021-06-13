import 'package:flutter/material.dart';
import '../../BookInfo/Components/one_book_widget.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';
class getBooksW extends StatelessWidget {
  const getBooksW({
    Key key,
    @required BookInfoController con1,
  }) : _con1 = con1, super(key: key);

  final BookInfoController _con1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _con1.fetchSimilarBooks("19"),
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