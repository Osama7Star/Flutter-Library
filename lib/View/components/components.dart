import 'package:flutter/material.dart';

import 'package:flutter_library_new/utilites/constants.dart';

import 'Screens/SuggestBook/Suggestbook.dart';
import 'Screens/search/search.dart';

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
      this.peiece: 1})
      : super(key: key);

  final String text;
  final Function pressed;
  final double height;
  final double peiece;

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
        child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0)),
            onPressed: pressed,
            color: kPrimaryColor,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
/// TODO : CHANGE CLOCK TEAXTCOLOR
AppBar AppBar11(BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    actions: [
      GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SuggestBook()),
            );
          },
          child: Icon(Icons.add, color: kSecondPrimaryColor)),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
            child: Icon(Icons.search, color: kSecondPrimaryColor)),
      ),
    ],
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: kSecondPrimaryColor),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Image.asset(
      "assets/images/logo.png",
      width: 50,
      height: 50,
    ),
    centerTitle: true,
  );
}

//// SHOW THE DATE
class DateWidget extends StatelessWidget {
  const DateWidget({
    Key key,
    this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Text(
            date,
            style: TextStyle(color: Colors.black54, fontSize: 10),
          )),
    );
  }
}


class booksNumbersW extends StatelessWidget {
  const booksNumbersW({
    Key key, this.booksNumbers,

  }) : super(key: key);

  final int booksNumbers;



  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top:8,bottom: 8),
        child:   Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SubText(text:'${booksNumbers}'),
            SubText(text:" : عدد الكتب  "),

          ],
        ),
      ),
    );
  }
}

