import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/CategoryBooks/CategoryBooks.dart';
import 'package:flutter_library_new/controller/category_controller.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';

import '../../../components.dart';

class CategoryNameLabel extends StatelessWidget {
  const CategoryNameLabel({
    Key key,
    this.categoryId,
    this.con,
  }) : super(key: key);

  final categoryId;
  final CategoryController con;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: con.fetchCategoryInfo(categoryId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CategoryModel> list = snapshot.data;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryBooks(
                      categoryId: list[0].categoryId,
                      categoryName: list[0].categoryName),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('عرض الكل'),
                    SubText(text: list[0].categoryName,textSize: 18,),
                  ],
                ),
              ),
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
