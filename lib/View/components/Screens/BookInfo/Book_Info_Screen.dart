import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/Authors/Author_Information.dart';
import 'package:flutter_library_new/View/components/Screens/CategoryBooks/CategoryBooks.dart';
import 'package:flutter_library_new/models/BorrowingModel.dart';
import 'package:flutter_library_new/utilites/functions.dart';
import 'Components/BookPage.dart';
import 'package:flutter_library_new/View/components/Screens/User/UserPage.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/signup/components/sign_form.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/controller/bookreviews_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/BookReview1.dart';
import 'package:flutter_library_new/models/route_argument.dart';
import 'package:flutter_library_new/models/BookReviewsModel.dart';
import 'package:flutter_library_new/models/route_argument.dart';
import 'package:flutter_library_new/utilites/ScreenArguments.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import 'package:flutter_library_new/utilites/enums.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/cupertino.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'Components/Similar_Book.dart';
import 'Components/add_review.dart';
import 'Components/book_detail.dart';
import 'Components/components.dart';
import 'Components/get_book_info.dart';
import 'Components/get_book_reviews.dart';

/// THIS WIDGET SHOW THE ALL INFORMATIONS FOR ONE BOOK
class BookInfo extends StatefulWidget {
  @override
  _BookInfoState createState() => _BookInfoState();

  static const routeName = '/extractArguments';

  final String bookId;
  final String categoryId;
  String name = '';
  String userId = '';
  String status = '';
  BookInfo({
    Key key,
    @required this.bookId,
    this.categoryId,
  }) : super(key: key);
  @override
  void initState() {

    name  = UserSimplePreferences.getName() ?? '';
    userId = UserSimplePreferences.getUserId() ?? '';
    status = UserSimplePreferences.getStatus() ?? '';
  }

  /// TODO : CHANGE THE BOOK IMAGE LINK FROM THE SERVER
  /// TODO SHOW THE AUTHOR IMAGE

}

class _BookInfoState extends State<BookInfo> {
  List<BookModel> futureBook;

  String review;

  double width123 = 200;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BookInfoController _con1 = BookInfoController();
    BookReviewsController _con2 = BookReviewsController();
    MediaQueryData _mediaQueryData;
    _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;

    //   String test = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar11(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GetBookInfoW(con1: _con1, bookId: widget.bookId),

                  /// USERS REVIEWS
                  SizedBox(height: 20),
                  LabelW(text: "تقييمات القراء", width: screenWidth / 2),
                  SizedBox(
                    height: 10
                  ),

                  SingleChildScrollView(
                      child: GetBookReviewW(
                          function: _con2.fetchBookReviews(widget.bookId))),

                  ///END USERS REVIEWS

                  /// ADD REVIEWS

                  AddReviewW(_con2,widget.status),

                  ///TODO : CHANGE THE PROGRESS BAR TO ANIMATION
                  /// END ADD REVIEWS

                  SizedBox(height: 20),

                  /// GET SIMILAR BOOKS
                  LabelW(text: "كتب مشابهة", width: screenWidth / 2),
                  SizedBox(height: 10),
                  GetSimilarBooksW(
                    con1: _con1,
                    categoryId: widget.categoryId,
                  ),

                  ///END GET SIMILAR BOOKS
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.book),
    );
  }


}





class BookInfoUserInfo extends StatelessWidget {
  const BookInfoUserInfo({
    Key key,
    @required this.bookReviews,
  }) : super(key: key);
  final BookReviewsModel bookReviews;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserPage()),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(bookReviews.imageUrl),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bookReviews.fullName, style: TextStyle(fontSize: 14)),
                  Text(
                    bookReviews.fullName,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}




class bookDetails extends StatelessWidget {
  const bookDetails({
    Key key,
    this.label,
    this.info,
  }) : super(key: key);
  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          child: Row(
            children: [
              Text("$label : "),
              SizedBox(
                width: 10,
              ),
              SubText(
                text: "$info",
                textSize: 17,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

