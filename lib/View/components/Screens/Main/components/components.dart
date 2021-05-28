import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/AddQuote/AddQuote.dart';
import 'package:flutter_library_new/View/components/Screens/Category/category.dart';
import 'package:flutter_library_new/utilites/constants.dart';

import '../../../components.dart';
class floatingActionButtonW extends StatelessWidget {
  const floatingActionButtonW({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddQuote()),
        );
      },
      child: Icon(Icons.format_quote),
      backgroundColor: kPrimaryColor,
    );
  }
}



class categorylabel extends StatelessWidget {
  const categorylabel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SubText(
          text: "التصنيفات",
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Category()),
          );
        });
  }
}
