import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/components.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../coustme_bottom_nav_bar.dart';

class Test extends StatelessWidget {
final String imageUrl ;
final String text;

  const Test({Key key, this.imageUrl, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData;
    _mediaQueryData = MediaQuery.of(context);
    double screenHeight = _mediaQueryData.size.height;
    double containerHeight = screenHeight/2.5;
    return Scaffold(
      appBar: AppBar11(context),
      body: Container(
        height: screenHeight/2.5,
        width: double.infinity,
        color: Colors.black12,
        child: Card(
          child: Column(
            children: [
              SizedBox(
                height: containerHeight/1.4,
                  child: FadeInImage(image: NetworkImage('https://st2.depositphotos.com/1105977/5461/i/600/depositphotos_54615585-stock-photo-old-books-on-wooden-table.jpg'), placeholder: AssetImage("assets/images/default-book.png"))),
              SizedBox(height: 30),
              SizedBox(
                  height: containerHeight/9,

                  child: Text('العلمانية الشاملة والعلمانية الجزئية')),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.book),
    );
  }
}
