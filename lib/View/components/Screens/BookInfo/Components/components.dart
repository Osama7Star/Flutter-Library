import 'package:flutter/material.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/BookReviewsModel.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../components.dart';
import '../Book_Info_Screen.dart';
import 'book_detail.dart';


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
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          // Center(
          //   child: FadeInImage(
          //     image: NetworkImage(imageUrl),
          //     placeholder: AssetImage("assets/images/default-book.png"),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,

              ),

            ),
          ),
          if (ISBN.isNotEmpty) LabelW(text: ISBN)
        ],
      ),
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
