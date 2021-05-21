import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/BorrowingModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';

class borrowBook extends StatelessWidget {
  BookInfoController _con1 = new BookInfoController();
  bool bookStatus1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar11(context),
      body: FutureBuilder(
        future: _con1.fetchBookByISBN("S87"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BookModel> list = snapshot.data;

            return Column(
              children: [
                Card(
                  //TODO : CHECK IF THE BOOK IS EXIST
                  child: Column(
                    children: [
                      BookImage(imageUrl: list[0].imageUrl, ISBN: "12L"),
                      SizedBox(height: 10),
                      SubText(text: list[0].bookName, textSize: 24),
                      SizedBox(height: 15),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                /// CHECK BOOK STATUS
                list[0].bookStatus == "0"
                    ? Text('متاح للإستعارة')
                    :

                    /// IF BOOK NOT AVAILABLE FOR BORROWING

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

class NotAvilableWidget extends StatelessWidget {
  const NotAvilableWidget({
    Key key,
    @required BookInfoController con1,
    @required this.list,
  }) : _con1 = con1, super(key: key);

  final BookInfoController _con1;
  final List<BookModel> list;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _con1.fetchBorrowingInfo(list[0].bookId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BorrowingModel> list = snapshot.data;

            return Align(

              alignment: Alignment.center,

              child: (RichText(
                text: TextSpan(
                    text: 'الكتاب غير متاح للإستعارة \n ',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,


                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '  تم إستعارته من قبل ${list[0].fullName}  \n  ',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                        fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text:
                            ' حتى تاريخ  ${list[0].endDate}  ',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      )
                    ]),
              )),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
