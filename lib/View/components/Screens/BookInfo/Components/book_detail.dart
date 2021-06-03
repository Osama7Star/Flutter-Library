import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/Authors/author_information_screen.dart';
import 'package:flutter_library_new/View/components/Screens/CategoryBooks/CategoryBooks.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/BorrowingModel.dart';
import 'package:flutter_library_new/utilites/constants.dart';

import '../../../components.dart';
import '../Book_Info_Screen.dart';
import 'components.dart';
class BookDetailsW extends StatelessWidget {
  final BookModel bookModel;

  BookDetailsW({Key key, @required this.bookModel}) : super(key: key);
  BookInfoController _con1 = new BookInfoController();

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
                        builder: (context) => AuthorInformationScreen(
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
            text: bookModel.note,
            color: kSecondPrimaryColor,
          ),
          SizedBox(height: 15),
          BookInfoSummary(summary: bookModel.summary),
          SizedBox(height: 15),
          bookModel.bookStatus == "0"
              ? Text(
            'الكتاب متاح للإستعارة',
            style: textStyle.copyWith(color: kPrimaryColor, fontSize: 20),
          )
              : FutureBuilder(
            future: _con1.fetchBorrowingInfo(bookModel.bookId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<BorrowingModel> list = snapshot.data;

                return Align(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text:
                        'الكتاب غير متاح للإستعارة \n تم إستعارة الكتاب من قبل ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' [ ${list[0].fullName} ]',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '  \n حتى تاريخ  ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.normal),
                          ),
                          TextSpan(
                            text: '[ ${list[0].endDate}] ',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                );
                //SubText(text: "   الكتاب غير متاح للإستعارة \n  تم الإستعارة من قبل ${list[0].fullName + list[0].endDate } \n حتى تاريخ ");

              } else if (snapshot.hasError) {
                return Text("Error");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),

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
