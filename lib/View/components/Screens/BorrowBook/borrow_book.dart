import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/AddQuote/components/not_logged.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Book_Info_Screen.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Components/components.dart';
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
  borrowBook({Key key, this.categoryId}) : super(key: key);

  @override
  _borrowBookState createState() => _borrowBookState();

  final String categoryId;
}

class _borrowBookState extends State<borrowBook> {
  BookInfoController _con1 = new BookInfoController();
  String name = '';
  String userId = '';
  String status = '';

  @override
  void initState() {
    super.initState();
    UserSimplePreferences.setName("Osama");
    UserSimplePreferences.setStatus("1");
    UserSimplePreferences.setUserId("10");

    name = UserSimplePreferences.getName() ?? '';
    userId = UserSimplePreferences.getUserId() ?? '';
    status = UserSimplePreferences.getStatus() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context),
      body: Container(
        child: status == '1aa'
            ? NotLogged(text: 'الرجاء تسجيل الدخول حتى تتمكن من إستعارة الكتاب')
            : SingleChildScrollView(
                child: FutureBuilder(
                  future: _con1.fetchBookByISBN(widget.categoryId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<BookModel> list = snapshot.data;

                      return list.length > 0
                          ? Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BookInfo(
                                            bookId: list[0].bookId,
                                            categoryId: list[0].categoryId),
                                      ),
                                    );
                                  },

                                  /// GET USER BASIC INFORMATION (IMAGE,NAME)
                                  /// TODO: CHANGE ISBN
                                  child: bookInfoW(list: list),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                /// CHECK BOOK STATUS
                                list[0].bookStatus == "0"

                                    /// IF BOOK IS AVAILABLE FOR BORROWING

                                    ? bookIsAvilableW(
                                        bookId: list[0].bookId, userId: "80")
                                    :

                                    /// IF BOOK IS NOT AVAILABLE FOR BORROWING

                                    NotAvilableWidget(con1: _con1, list1: list),
                              ],
                            )

                          /// if the book is not available
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                SubText(
                                  text: "الكتاب غير موجود",
                                  textSize: 25,
                                ),
                                SubText(
                                  text: "تأكد من قراءة الباركود الصحيح",
                                  textSize: 20,
                                ),
                                SizedBox(height: 45),
                                Image.asset(
                                  "assets/images/not.png",
                                ),
                              ],
                            );
                    } else if (snapshot.hasError) {
                      return Text("Error");
                    }

                    // By default, show a loading spinner.
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
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
          BookImage(imageUrl: list[0].imageUrl, ISBN: list[0].ISBN),
          SizedBox(height: 20),
          SubText(text: list[0].bookName, textSize: 24),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
