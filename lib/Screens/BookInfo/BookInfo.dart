import 'package:flutter/material.dart';
import 'package:flutter_library_new/Screens/Main/components/BookPage.dart';
import 'package:flutter_library_new/components/components.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/BookReview.dart';
import 'package:flutter_library_new/utilites/constants.dart';

class BookInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar11(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BookImage(),
              SizedBox(height: 10),
              SubText(text: "السيرة الذاتية للمسيري", textSize: 24),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    bookDetails(label: "التصنيف ", info: " أدب"),
                    bookDetails(label: "الكاتب ", info: " عبد الوهاب المسيرية"),
                    bookDetails(label: "  عدد الصفحات ", info: "200"),
                    BookInfoTag(),
                    SizedBox(height: 10),
                    BookInfoSummary(),
                    ...List.generate(
                        bookReviewsDemo.length,
                        (index) => BookReviews1(
                              bookReviews: bookReviewsDemo[index],
                            )),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              bookDemo.length,
                              (index) =>
                                  OnebookWidget(bookModel: bookDemo[index]))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class BookReviews1 extends StatelessWidget {
  const BookReviews1({
    @required this.bookReviews,
    Key key,
  }) : super(key: key);

  final BookReviews bookReviews;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          BookInfoUserInfo(
            bookReviews: bookReviews,
          ),
          SizedBox(height: 10),
          Text(
            bookReviews.review,
            style: textStyle,
          ),
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
  final BookReviews bookReviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://cdn02.plentymarkets.com/4n91gk7bomyj/item/images/124582293/full/--------------------------------------------------------------------------01.jpg'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bookReviews.name, style: TextStyle(fontSize: 14)),
                Text(
                  bookReviews.userName,
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
    );
  }
}

class BookInfoSummary extends StatelessWidget {
  const BookInfoSummary({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SubText(
            text: " ملخص الكتاب",
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
                "Now consider a second example, this time with an aspect ratio of 2.0 and layout constraints that require the width",
                textAlign: TextAlign.center,
                style: textStyle),
          ),
        ],
      ),
    );
  }
}

class BookInfoTag extends StatelessWidget {
  const BookInfoTag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Button(
          text: "علم ",
          pressed: () {},
          height: 35,
          peiece: 4,
        ),
        Button(
          text: "ثقافة",
          pressed: () {},
          height: 35,
          peiece: 4,
        ),
        Button(
          text: "فكر",
          pressed: () {},
          height: 35,
          peiece: 4,
        ),
      ],
    );
  }
}

class BookImage extends StatelessWidget {
  const BookImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: Center(
        child: Image.network(
            "https://cdn02.plentymarkets.com/4n91gk7bomyj/item/images/124582293/full/--------------------------------------------------------------------------01.jpg"),
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
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        child: Row(
          children: [
            Align(alignment: Alignment.topRight, child: Text(info)),
            SizedBox(
              width: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: SubText(
                text: " : $label ",
                textSize: 17,
              ),
            )
          ],
        ),
      ),
    );
  }
}
