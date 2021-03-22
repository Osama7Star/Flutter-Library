import 'package:flutter/material.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/utilites/constants.dart';

class category_list extends StatelessWidget {
  final CategoryModel categoryModel;

  const category_list({Key key, this.categoryModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Text(
              categoryModel.categoryName,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
