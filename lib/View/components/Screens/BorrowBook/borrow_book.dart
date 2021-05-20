import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';

class borrowBook extends StatelessWidget {
  BookInfoController _con1 = new BookInfoController();
  bool bookStatus1 = false;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar11(context),
      body: FutureBuilder(
        future: _con1.fetchBookById("72"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BookModel> list = snapshot.data;


            Column(
              children: [
                BookImage(imageUrl: list[0].imageUrl, ISBN:"12L"),
                SizedBox(height: 10),
                SubText(text: list[0].bookName, textSize: 24),
                SizedBox(height: 15),


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
