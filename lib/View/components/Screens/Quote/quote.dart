import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';
import 'package:flutter_library_new/View/components/Screens/User/UserPage.dart';
import 'package:flutter_library_new/controller/bookreviews_controller.dart';
import 'package:flutter_library_new/controller/quote_controller.dart';
import 'package:flutter_library_new/models/QuoteModel.dart';
import 'package:flutter_library_new/utilites/constants.dart';





class Quote extends StatelessWidget {

  QuoteController _con = QuoteController();
  final Future<dynamic> function;
   Quote({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 200),
      child: FutureBuilder(
        future: function,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QuoteModel> list = snapshot.data;
            return ListView.builder(
                physics: NeverScrollableScrollPhysics(),

                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return BookReviews1(
                    quoteModel: list[index],
                  );
                });
          } else if (snapshot.hasError) {
            return Text("Error");
          }

          ///TODO: MAKE THE PROGRESSBAR IN THE CENTER

          // By default, show a loading spinner.
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator()
            ],
          );
        },
      ),
    );
  }
}

class BookReviews1 extends StatelessWidget {
  const BookReviews1({
    @required this.quoteModel,
    Key key,
  }) : super(key: key);

  final QuoteModel quoteModel;

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
                quoteModel: quoteModel,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            quoteModel.quote,
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
    @required this.quoteModel,
  }) : super(key: key);
  final QuoteModel quoteModel;

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
                backgroundImage: NetworkImage(quoteModel.imageUrl),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(quoteModel.fullName, style: TextStyle(fontSize: 14)),
                  Text(
                    quoteModel.fullName,
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
