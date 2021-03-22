import 'package:flutter/material.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';

import 'components/cateory_list.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          Container(
              child: Container(
            child: GridView.builder(
              itemCount: categoryDemo.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return category_list(categoryModel: categoryDemo[index]);
              },
            ),
          )),
        ],
      ),
    );
  }
}
