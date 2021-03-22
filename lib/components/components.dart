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
  const SubText({Key key, @required this.text, this.textSize = 16})
      : super(key: key);

  final String text;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: kPrimaryColor,
          fontSize: textSize,
          fontWeight: FontWeight.bold),
    );
  }
}

class Button extends StatelessWidget {
  const Button(
      {Key key,
      @required this.text,
      @required this.pressed,
      this.height: 50,
      this.peiece})
      : super(key: key);

  final String text;
  final Function pressed;
  final double height;
  final int peiece;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double width11 = queryData.size.width / peiece;

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        width: width11,
        height: height,
        child: FlatButton(
            onPressed: pressed,
            color: kPrimaryColor,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
