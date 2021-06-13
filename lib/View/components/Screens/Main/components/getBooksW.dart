import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';

import '../../test.dart';

class getBooksW extends StatelessWidget {
  const getBooksW({
    Key key,
    @required BookInfoController con1,
  })  : _con1 = con1,
        super(key: key);

  final BookInfoController _con1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _con1.fetchSimilarBooks("19"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<BookModel> list = snapshot.data;
          return Container(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 5.0 / 9.0,


              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 4,

              children: List.generate(list.length, (index) {
                return SizedBox(
                  child: Test(
                      imageUrl: list[index].imageUrl,
                      text: list[index].bookName),
                );
              }),
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
