import 'package:flutter/material.dart';
import 'package:flutter_library_new/Screens/BookInfo/BookInfo.dart';
import 'package:flutter_library_new/Screens/Main/components/BookPage.dart';
import 'package:flutter_library_new/components/components.dart';
import 'package:flutter_library_new/components/coustme_bottom_nav_bar.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/BookReview.dart';
import 'package:flutter_library_new/utilites/enums.dart';

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
                SizedBox(
                  height: 50,
                  child: AppBar(
                    bottom: TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(Icons.book),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.local_activity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // create widgets for each tab bar here
                Expanded(
                  child: TabBarView(
                    children: [
                      // first tab bar view widget
                      SingleChildScrollView(
                        child:Column(
                          children: [
                            ...List.generate(bookDemo.length,
                                    (index) => OnebookWidget(bookModel: bookDemo[index],numberOfbook: 1,))
                          ],
                        )
                      ),

                      // second tab bar viiew widget
                      SingleChildScrollView(
                          child:UserPage()
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),

      ),

    );
  }
}