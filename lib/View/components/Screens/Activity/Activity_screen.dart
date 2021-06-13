import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/quote_controller.dart';
import 'package:flutter_library_new/controller/readingbooks_controller.dart';
import 'package:flutter_library_new/View/components/Screens/Quote/quote.dart';
import 'package:flutter_library_new/View/components/Screens/ReadingBooks/reading_books.dart';
import 'package:flutter_library_new/utilites/SizeConfig.dart';
import 'package:flutter_library_new/utilites/enums.dart';
import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';

class ActivityScreen extends StatelessWidget {
  QuoteController _con = QuoteController();
  ReadingBooksController _con1 = ReadingBooksController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MyAppBar(context),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            // the tab bar with two items
            SizedBox(
              height: 60,
              child: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Column(
                      children: [
                        Icon(
                          Icons.book,
                        ),
                        Text(
                          'قراءات ',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    )),
                    Tab(
                        child: Column(
                      children: [
                        Icon(
                          Icons.format_quote,
                        ),
                        Text(
                          'إقتباسات ',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    )),
                  ],
                ),
              ),
            ),

            // create widgets for each tab bar here
            SizedBox(
              height: getScreenHeight(),
              child: TabBarView(
                children: [
                  /// GET THE READING

                  SingleChildScrollView(
                    child: ReadingBooks(
                      function: _con1.fetchReadingBooks(),
                    ),
                  ),

                  /// GET THE Quotes

                  SingleChildScrollView(
                    child: Quote(
                      function: _con.fetchQuotes(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
        bottomNavigationBar:
            CustomBottomNavBar(selectedMenu: MenuState.activity),
      ),
    );
  }
}
