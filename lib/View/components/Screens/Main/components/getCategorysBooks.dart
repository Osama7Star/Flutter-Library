import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookPage.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/controller/category_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';

import 'CategoryNameLabel.dart';


class GetCategoryBooks extends StatelessWidget {
  const GetCategoryBooks({
    Key key,
    @required BookInfoController con1,@required this.categoryId, this.con2,
  }) : _con1 = con1, super(key: key);

  final BookInfoController _con1;
  final CategoryController  con2;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CategoryNameLabel(categoryId:categoryId,con: con2 ),
        FutureBuilder(
          future: _con1.fetchCategory1Books(categoryId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<BookModel> list = snapshot.data;
              return Container(
                height: 370,
                margin: EdgeInsets.all(10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return onBookWidget(bookModel: list[index]);
                    }),
              );
            } else if (snapshot.hasError) {
              return Text("Error");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
