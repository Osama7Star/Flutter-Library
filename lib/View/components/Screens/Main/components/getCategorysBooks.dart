import 'package:flutter/material.dart';
import '../../../components.dart';
import '../../BookInfo/Components/one_book_widget.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/controller/category_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';

import 'CategoryNameLabel.dart';


class GetCategoryBooks extends StatelessWidget {
  const GetCategoryBooks({
    Key key,
    @required BookInfoController con1,@required this.categoryId, this.con2,
    this.needForLabel = true, this.function
  }) : _con1 = con1, super(key: key);

  final BookInfoController _con1;
  final CategoryController  con2;
  final String categoryId;
  final bool  needForLabel ;
  final Future<dynamic> function ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        needForLabel == true?   CategoryNameLabel(categoryId:categoryId,con: con2 ):
        SubText(text:'آخر الكتب إضافة'),
        FutureBuilder(
          future: function,
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
                      return OneBookWidget(bookModel: list[index]);
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
