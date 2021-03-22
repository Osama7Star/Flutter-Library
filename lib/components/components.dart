import 'package:flutter/material.dart';
import 'package:flutter_library_new/Screens/SuggestBook/Suggestbook.dart';
import 'package:flutter_library_new/Screens/search/search.dart';
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
  const SubText(
      {Key key,
      @required this.text,
      this.textSize = 16,
      this.color = kPrimaryColor,
      this.isCenter = false})
      : super(key: key);

  final String text;
  final double textSize;
  final Color color;
  final bool isCenter;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color, fontSize: textSize, fontWeight: FontWeight.bold),
    );
  }
}

class Button extends StatelessWidget {
  const Button(
      {Key key,
      @required this.text,
      @required this.pressed,
      this.height: 50,
      this.peiece:1})
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

AppBar AppBar11(BuildContext context) {
  return AppBar(
    actions: [
      GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SuggestBook()),
            );
          },
          child: Icon(Icons.add)),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
            child: Icon(Icons.search)),
      ),
    ],
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text("Sample"),
    centerTitle: true,
  );
}
