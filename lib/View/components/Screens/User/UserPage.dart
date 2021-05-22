import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';
import 'package:flutter_library_new/View/components/Screens/Quote/quote.dart';
import 'package:flutter_library_new/View/components/Screens/ReadingBooks/reading_books.dart';
import 'package:flutter_library_new/controller/bookreviews_controller.dart';
import 'package:flutter_library_new/controller/quote_controller.dart';
import 'package:flutter_library_new/controller/readingbooks_controller.dart';
import 'package:flutter_library_new/controller/user_controller.dart';
import 'package:flutter_library_new/models/UserModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';

class UserPage extends StatelessWidget {
  QuoteController _con = QuoteController();

  BookReviewsController _con2 = BookReviewsController();
  ReadingBooksController _con1 = ReadingBooksController();
  final String userId;

   UserPage({Key key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar11(context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: SizedBox(
                /// TODO : Change the size of the page
                height: 2000,
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
                          /// GET THE BOOK READED BY USER
                          ReadingBooks(function: _con1.fetchUserReadingBooks("78")),

                          /// GET THE QUOTES READED BY USER

                          SingleChildScrollView(child: Quote(function:_con.fetchUserQuotes("78") ,)),

                          /// GET THE REVIEWS READED BY USER

                          GetBookReviewW(function: _con2.fetchUserReviews("78")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar:
              CustomBottomNavBar(selectedMenu: MenuState.activity),
        ));
  }


}

class UserInfo extends StatelessWidget {
   UserInfo({
    Key key,
  }) : super(key: key);
  UserController _con3 = UserController();

  @override
  Widget build(BuildContext context) {
    return Card(
        child: FutureBuilder(
          future: _con3.fetchUser("78"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<UserModel> list = snapshot.data;
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),

                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
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
                                    list[0].imageUrl),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SubText(text: list[0].fullName, textSize: 24),
                            SizedBox(
                              height: 5,
                            ),
                            SubText(
                              text: list[0].universityName,
                              textSize: 16,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SubText(text: list[0].collageName, textSize: 16, color: Colors.black),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("Error");
            }

            ///TODO: MAKE THE PROGRESSBAR IN THE CENTER

            // By default, show a loading spinner.
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator()
              ],
            );
          },
        ),);
  }
}

