import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/quote_controller.dart';
import '../BookInfo/BookPage.dart';
import 'package:flutter_library_new/View/components/Screens/Quote/quote.dart';
import 'package:flutter_library_new/View/components/Screens/ReadingBooks/reading_books.dart';
import 'package:flutter_library_new/View/components/Screens/User/UserPage.dart';

import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';

class ActivityAcreen extends StatelessWidget {
  QuoteController _con = QuoteController();

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
                      ReadingBooks(),

                      // second tab bar viiew widget
                      SingleChildScrollView(
                          child:Quote(function:_con.fetchQuotes())
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.activity),

      ),

    );
  }
}
