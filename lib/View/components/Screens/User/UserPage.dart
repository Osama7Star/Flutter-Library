import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/Quote/quote.dart';
import 'package:flutter_library_new/View/components/Screens/ReadingBooks/reading_books.dart';
import 'package:flutter_library_new/controller/quote_controller.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';

class UserPage extends StatelessWidget {
  QuoteController _con = QuoteController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar11(context),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 1000,
              child: Column(
                children: <Widget>[
                  UserInfo(),
                  // the tab bar with two items
                  SizedBox(
                    height: 50,
                    child: AppBar(
                      bottom: TabBar(
                        tabs: [

                          /// TODO : ADD WOR TO THE ICONS
                          Tab(
                            icon: Icon(Icons.book),
                          ),
                          Tab(
                            icon: Icon(
                              Icons.local_activity,
                            ),
                          ),
                          Tab(
                            icon: Icon(Icons.book),
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
                        SingleChildScrollView(child: Quote(function:_con.fetchUserQuotes("75") ,)),
                        Text('test'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar:
              CustomBottomNavBar(selectedMenu: MenuState.activity),
        ));
  }

  Card UserInfo() {
    return Card(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            height: 200,
            child: CircleAvatar(
              radius: 0,
              backgroundImage: NetworkImage(
                  'https://qph.fs.quoracdn.net/main-qimg-134e3bf89fff27bf56bdbd04e7dbaedf.webp'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SubText(text: "   محمد علي", textSize: 24),
          SizedBox(
            height: 5,
          ),
          SubText(
            text: "جامعة إسطنبول",
            textSize: 16,
            color: Colors.black,
          ),
          SizedBox(
            height: 5,
          ),
          SubText(text: "كلية الحاسوب", textSize: 16, color: Colors.black),
        ],
      ),
    ));
  }
}

