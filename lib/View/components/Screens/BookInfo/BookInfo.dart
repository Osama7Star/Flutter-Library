import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/Authors/Author_Information.dart';
import 'package:flutter_library_new/View/components/Screens/CategoryBooks/CategoryBooks.dart';
import 'BookPage.dart';
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

/// THIS WIDGET SHOW THE ALL INFORMATIONS FOR ONE BOOK
class BookInfo extends StatefulWidget {
  @override
  _BookInfoState createState() => _BookInfoState();

  static const routeName = '/extractArguments';

  final String bookId;
  final String categoryId;

  BookInfo({
    Key key,
    @required this.bookId,
    this.categoryId,
  }) : super(key: key);

  /// TODO : CHANGE THE BOOK IMAGE LINK FROM THE SERVER
  /// THEY SHOW THE AUTHOR IMAGE
  /// TODO : ADD NOTE
}

class _BookInfoState extends State<BookInfo> {
  double _rating = 0;
  List<BookModel> futureBook;
  final _formKey = GlobalKey<FormState>();

  double userAdedRate = 0;
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
                  SizedBox(
                    height: 20,
                  ),
                  LabelW(text: "تقييمات القراء", width: screenWidth / 2),
                  SizedBox(
                    height: 10,
                  ),

                  SingleChildScrollView(child: GetBookReviewW(function: _con2.fetchBookReviews(widget.bookId))),

                  ///END USERS REVIEWS

                  /// ADD REVIEWS

                  AddReviewW(),

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

  /// TODO : HIDE PROGRESSBAR IF THERE ARE NOT REVIEWS
  Card AddReviewW() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    NameInputField(
                        hint: "أضف مراجعة",
                        minChar: 5,
                        emptyErroMessage: "إكتب شيئاً",
                        lengehtErroMessage: "الإسم يجب أن يكون أكثر من 3  أحرف",
                        icon: Icons.add,
                        couldBeEmpty: true),
                    SizedBox(height: 10),
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: kSecondPrimaryColor,
                      ),
                      onRatingUpdate: (rating) {
                        userAdedRate = rating;
                      },
                    ),
                    SizedBox(height: 20),
                    Button(
                        text: "إضافة مراجعة",
                        pressed: () {
                          if (_formKey.currentState.validate() &&
                              userAdedRate != 0) {
                            print('the rate is $userAdedRate');
                          } else {
                            print("Error $userAdedRate");
                          }
                        })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class GetBookInfoW extends StatelessWidget {
  const GetBookInfoW({
    Key key,
    @required BookInfoController con1,
    @required this.bookId,
  })  : _con1 = con1,
        super(key: key);

  final String bookId;
  final BookInfoController _con1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _con1.fetchBookById(bookId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<BookModel> list = snapshot.data;

          return BookDetailsW(bookModel: list[0]);

        } else if (snapshot.hasError) {
          return Text("Error");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}

class GetBookReviewW extends StatelessWidget {


  final Future<dynamic> function ;
  final String bookId;

  const GetBookReviewW({Key key, this.function, this.bookId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(

            builder: (context) => BookInfo(bookId:bookId),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future:function,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<BookReviewsModel> list = snapshot.data;
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return BookReviews1(
                      bookReviews: list[index],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("Error");
            }

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class GetSimilarBooksW extends StatelessWidget {
  const GetSimilarBooksW({
    Key key,
    @required BookInfoController con1,
    this.categoryId,
  })  : _con1 = con1,
        super(key: key);

  final BookInfoController _con1;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _con1.fetchSimilarBooks(categoryId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<BookModel> list = snapshot.data;
          return Container(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return onBookWidget(bookModel: list[index]);
                }),
          );
        } else if (snapshot.hasError) {
          return Text("Error");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}

class RatingBarW extends StatelessWidget {
  const RatingBarW({
    Key key,
    this.rate,
  }) : super(key: key);

  final double rate;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rate,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: kSecondPrimaryColor,
      ),
      itemCount: 5,
      itemSize: 30.0,
      unratedColor: Colors.amber.withAlpha(50),
      direction: true ? Axis.horizontal : Axis.horizontal,
    );
  }
}

class LabelWidget extends StatelessWidget {
  const LabelWidget({Key key, this.text, this.color: kSecondPrimaryColor})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity / 2,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: color.withOpacity(.8),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SubText(
                text: text,
                color: Colors.white,
              ),
            )));
  }
}

class BookReviews1 extends StatelessWidget {
  const BookReviews1({
    @required this.bookReviews,
    Key key,
  }) : super(key: key);

  final BookReviewsModel bookReviews;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: BookInfoUserInfo(
                bookReviews: bookReviews,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            bookReviews.review,
            style: textStyle,
          ),
          RatingBarW(rate: double.parse(bookReviews.rate)),
          DateWidget(date: bookReviews.date),

          SizedBox(height: 10),
        ],
      ),
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

class BookInfoSummary extends StatelessWidget {
  const BookInfoSummary({
    Key key,
    @required this.summary,
  }) : super(key: key);

  final String summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            SubText(
              text: " ملخص الكتاب",
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(summary,
                  textAlign: TextAlign.center,
                  style: textStyle.copyWith(
                      fontWeight: FontWeight.normal, fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}

class BookInfoTag extends StatelessWidget {
  const BookInfoTag({
    Key key,
    this.bookModel,
  }) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Button(text: bookModel.tag1, pressed: () {}, height: 30, peiece: 3.4),
        Button(text: bookModel.tag2, pressed: () {}, height: 30, peiece: 3.4),
        Button(text: bookModel.tag3, pressed: () {}, height: 30, peiece: 3.4),
      ],
    );
  }
}

class BookImage extends StatelessWidget {
  const BookImage({
    Key key,
    @required this.imageUrl,
    this.ISBN = "",
    this.imageHeight = 500,
  }) : super(key: key);

  final String imageUrl;
  final String ISBN;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          ///TODO :ADD PLACEHOLDER UNTIL DOWNLOAD THE IMAGE
          Center(
            child: Image.network(
              imageUrl,
            ),
          ),
          if (ISBN.isNotEmpty) LabelW(text: ISBN)
        ],
      ),
    );
  }
}

class LabelW extends StatelessWidget {
  const LabelW({
    Key key,
    @required this.text,
    this.width: 60,
    this.height: 35,
  }) : super(key: key);

  final String text;

  final double width;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: Text(text,
            textAlign: TextAlign.center,
            style: textStyle.copyWith(color: Colors.white)),
        padding: const EdgeInsets.fromLTRB(14.0, 7, 14, 7),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 1),
          ],
        ));
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

class BookDetailsW extends StatelessWidget {
  final BookModel bookModel;

  const BookDetailsW({Key key, @required this.bookModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          BookImage(imageUrl: bookModel.imageUrl, ISBN: bookModel.ISBN),
          SizedBox(height: 10),
          SubText(text: bookModel.bookName, textSize: 24),
          SizedBox(height: 15),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryBooks(
                          categoryId: bookModel.categoryId,
                          categoryName: bookModel.categoryName,
                        ),
                      ),
                    );
                  },
                  child: bookDetails(
                      label: "التصنيف ", info: bookModel.categoryName),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthorInformation(
                          authorId: bookModel.authorId,
                        ),
                      ),
                    );
                  },
                  child:
                      bookDetails(label: "الكاتب ", info: bookModel.authorName),
                ),
                bookDetails(label: "عدد الصفحات ", info: bookModel.bookPages),
              ],
            ),
          ),
          SizedBox(height: 15),
          RatingBarW(rate: 4.4),
          SizedBox(height: 15),
          BookInfoTag(bookModel: bookModel),
          SizedBox(height: 15),

          SubText(
            text:bookModel.note,
            color: kSecondPrimaryColor,
          ),
          SizedBox(height: 15),
          BookInfoSummary(summary: bookModel.summary),
          SizedBox(height: 15),
          Text(
            'الكتاب متاح للإستعارة',
            style: textStyle.copyWith(color: kPrimaryColor, fontSize: 20),
          )
        ],
      ),
    );
  }
}
