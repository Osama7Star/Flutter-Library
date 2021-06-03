import 'package:flutter/material.dart';
import '../BookInfo/Components/one_book_widget.dart';

import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'UserPage.dart';

class profilePage extends StatefulWidget {
  @override
  profilePageState createState() => profilePageState();
}

class profilePageState extends State<profilePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar11(context),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 800,
            child: Column(

              children: <Widget>[
                // construct the profile details widget here
                UserPage(),

                // the tab bar with two items

              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),

      ),

    );
  }
}