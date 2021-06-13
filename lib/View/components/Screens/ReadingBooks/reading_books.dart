import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Book_Info_Screen.dart';
import 'package:flutter_library_new/View/components/Screens/User/UserPage.dart';
import 'package:flutter_library_new/controller/readingbooks_controller.dart';
import 'package:flutter_library_new/models/ReadingBooksModel.dart';

import '../../components.dart';
import 'Components/components.dart';

class ReadingBooks extends StatelessWidget {
  ReadingBooksController _con = ReadingBooksController();
  final Future<dynamic> function;

  ReadingBooks({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadingBookW(con: _con, function: function);
  }
}

class ReadingBookW extends StatelessWidget {
  final ReadingBooksController con;
  final Future<dynamic> function;

  const ReadingBookW({Key key, this.con, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 350),
      child: Center(
        child: FutureBuilder(
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
                    return ReadingBookWidget(
                      readingBooksModel: list[index],
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

class ReadingBookWidget extends StatelessWidget {
  const ReadingBookWidget({
    @required this.readingBooksModel,
    Key key,
  }) : super(key: key);

  final ReadingBooksModel readingBooksModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookInfo(
                bookId: readingBooksModel.bookId,
                /// TODO : ADD CATEGORYID
                categoryId: "20",
              ),
            ),
          );
        },
        child: Column(
          children: [
            SizedBox(height: 10),

            ///TODO : MAKE THE TEXT BESIDE THE IMAGE
            ///MAKE THE NAME OF THE USER AND THE NAME OF THE BOOK BOLD BY USING RICH TEXT
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child:

                  readingBookTextW(readingBooksModel: readingBooksModel)),
                  SizedBox(width: 10),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: BookInfoUserInfo(
                      readingBooksModel: readingBooksModel,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            DateWidget(date: readingBooksModel.startDate),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}



class BookInfoUserInfo extends StatelessWidget {
  const BookInfoUserInfo({
    Key key,
    @required this.readingBooksModel
  }) : super(key: key);
  final ReadingBooksModel readingBooksModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserPage(userId: readingBooksModel.userId)),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                /// TODO : CHANGE THE IMAGE FROM BOOK IMAGE TO USER
                backgroundImage: NetworkImage(readingBooksModel.imageUrl),
              ),
            ],
          )
        ],
      ),
    );
  }
}
