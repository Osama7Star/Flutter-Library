import 'package:flutter/material.dart';

import '../../../components.dart';


class CategoryNameLabel extends StatelessWidget {
  const CategoryNameLabel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('عرض الكل'),
          SubText(text: "ثقافة"),
        ],
      ),
    );
  }
}