import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';
import 'package:flutter_library_new/View/components/Screens/User/UserPage.dart';
import 'package:flutter_library_new/controller/bookreviews_controller.dart';
import 'package:flutter_library_new/controller/quote_controller.dart';
import 'package:flutter_library_new/controller/readingbooks_controller.dart';
import 'package:flutter_library_new/models/QuoteModel.dart';
import 'package:flutter_library_new/models/ReadingBooksModel.dart';
import 'package:flutter_library_new/utilites/constants.dart';

import '../../components.dart';

class ReadingBooks extends StatelessWidget {
  ReadingBooksController _con = ReadingBooksController();
  final Future<dynamic> function;

  ReadingBooks({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetQuotes(con: _con, function: function);
  }
}

class GetQuotes extends StatelessWidget {
  final ReadingBooksController con;
  final Future<dynamic> function;

  const GetQuotes({Key key, this.con, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: function,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ReadingBooksModel> list = snapshot.data;
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return BookReviews1(
                  readingBooksModel: list[index],
                );
              });
        } else if (snapshot.hasError) {
          return Text("Error");
        }

        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class BookReviews1 extends StatelessWidget {
  const BookReviews1({
    @required this.readingBooksModel,
    Key key,
  }) : super(key: key);

  final ReadingBooksModel readingBooksModel;

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
                readingBooksModel: readingBooksModel,
              ),
            ),
          ),
          SizedBox(height: 10),

          ///TODO : MAKE THE TEXT BESIDE THE IMAGE
          ///MAKE THE NAME OF THE USER AND THE NAME OF THE BOOK BOLD BY USING RICH TEXT
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              "بدء    [${readingBooksModel.fullName}  ] بقراءة كتاب  [${readingBooksModel.bookName} ]",
              style: textStyle,
            ),
          ),
          SizedBox(
            height: 15,
          ),


             DateWidget(date: readingBooksModel.startDate),


          SizedBox(height: 10),
        ],
      ),
    );
  }
}



class BookInfoUserInfo extends StatelessWidget {
  const BookInfoUserInfo({
    Key key,
    @required this.readingBooksModel,
  }) : super(key: key);
  final ReadingBooksModel readingBooksModel;

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
                backgroundImage: NetworkImage(readingBooksModel.imageUrl),
              ),
            ],
          )
        ],
      ),
    );
  }
}
