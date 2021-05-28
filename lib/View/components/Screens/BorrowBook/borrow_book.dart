import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/BorrowingModel.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import 'package:flutter_library_new/utilites/enums.dart';
import 'package:flutter_library_new/utilites/functions.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'components/bookIsAvilableW.dart';
import 'components/bookIsNotAvilable.dart';

class borrowBook extends StatefulWidget {
  const borrowBook({Key key, this.categoryId}) : super(key: key);

  @override
  _borrowBookState createState() => _borrowBookState();

  final String categoryId;


}

class _borrowBookState extends State<borrowBook> {
  BookInfoController _con1 = new BookInfoController();






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar11(context),
      body: FutureBuilder(
        future: _con1.fetchBookByISBN(widget.categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BookModel> list = snapshot.data;

            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookInfo(bookId: list[0].bookId,categoryId: list[0].categoryId),
                      ),
                    );
                  },

                  /// GET USER BASIC INFORMATION (IMAGE,NAME)
                  child: bookInfoW(list: list),
                ),
                SizedBox(
                  height: 20,
                ),
                SubText(text:'إستعارة'),
                SizedBox(
                  height: 10,
                ),

                /// CHECK BOOK STATUS
                list[0].bookStatus == "0"

                /// IF BOOK IS AVAILABLE FOR BORROWING

                    ? bookIsAvilableW()
                    :

                /// IF BOOK IS NOT AVAILABLE FOR BORROWING

                NotAvilableWidget(con1: _con1, list: list),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("Error");
          }

          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.scan),
    );
  }
}

class bookInfoW extends StatelessWidget {
  const bookInfoW({
    Key key,
    @required this.list,
  }) : super(key: key);

  final List<BookModel> list;

  @override
  Widget build(BuildContext context) {
    return Card(
      //TODO : CHECK IF THE BOOK IS EXIST
      child: Column(
        children: [
          BookImage(imageUrl: list[0].imageUrl, ISBN: "12L"),
          SizedBox(height: 10),
          SubText(text: list[0].bookName, textSize: 24),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}




