import 'package:flutter/material.dart';
import 'package:flutter_library_new/utilites/constants.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class SubText extends StatelessWidget {
  const SubText({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
