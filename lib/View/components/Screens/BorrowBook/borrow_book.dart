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
                    // SubText(text: 'غير متاح للإستعارة${list[0].bookId}',color: Colors.red,)
                    //
                    // fetchBorrowingInf
                    FutureBuilder(
                        future: _con1.fetchBorrowingInfo(list[0].bookId),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<BorrowingModel> list = snapshot.data;

                            return (SubText(
                              text: 'غير متاح للإستعارة تم إستعارته من قبل   \n حتى تاريخ ${list[0].fullName}${list[0].fullName}',
                              color: Colors.red,
                            ));
                          }
                          return Center(child: CircularProgressIndicator());
                        }),
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
