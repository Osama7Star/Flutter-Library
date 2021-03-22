import 'package:flutter/material.dart';
import 'package:flutter_library_new/components/components.dart';


class CategoryNameLabel extends StatelessWidget {
  const CategoryNameLabel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('عرض الكل'),
        SubText(text: "ثقافة"),
      ],
    );
  }
}