import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  final String imageUrl;

  final String text;

  const Test({Key key, this.imageUrl, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData;
    _mediaQueryData = MediaQuery.of(context);
    double screenHeight = _mediaQueryData.size.height;
    double containerHeight = screenHeight / 2.5;
    return Container(
      height: 900,
      width: double.infinity,
      color: Colors.black12,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height:255,
              child: FadeInImage(
                image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,

                  placeholder: AssetImage("assets/images/default-book.png"),

              ),
            ),
            SizedBox(height: 5),
            SizedBox(child: Center(child: Text(text))),
          ],
        ),
      ),
    );
  }
}
