import 'package:flutter/material.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';

import 'components/cateory_list.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
      width: double.infinity,
      height: 200,
      child: Container(
        //     child: GridView.count(

        //   // Create a grid with 2 columns. If you change the scrollDirection to
        //   // horizontal, this produces 2 rows.
        //   crossAxisCount: 2,
        //   children: List.generate(categoryModel.length, (index) {
        //     return Center(
        //         child: category_list(categoryModel: categoryModel[index]));
        //   }),
        // )),

        child: GridView.builder(
          itemCount: categoryDemo.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return category_list(categoryModel: categoryDemo[index]);
          },
        ),
      ),
    ));
  }
}
