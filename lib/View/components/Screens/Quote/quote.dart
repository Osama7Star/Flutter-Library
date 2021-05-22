import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';
import 'package:flutter_library_new/View/components/Screens/User/UserPage.dart';
import 'package:flutter_library_new/controller/bookreviews_controller.dart';
import 'package:flutter_library_new/controller/quote_controller.dart';
import 'package:flutter_library_new/models/QuoteModel.dart';
import 'package:flutter_library_new/models/UserModel.dart';
import 'package:flutter_library_new/utilites/constants.dart';

import '../../components.dart';





class Quote extends StatelessWidget {

  QuoteController _con = QuoteController();
  final Future<dynamic> function;
   Quote({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 200),
      child: Padding(
        child: FutureBuilder(
          future: function,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<UserModel> list = snapshot.data;
              return Card(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: CircleAvatar(
                            radius: 0,
                            backgroundImage: NetworkImage(
                                'https://qph.fs.quoracdn.net/main-qimg-134e3bf89fff27bf56bdbd04e7dbaedf.webp'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SubText(text:list[0].fullName, textSize: 24),
                        SizedBox(
                          height: 5,
                        ),
                        SubText(
                          text: list[0].universityName,
                          textSize: 16,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SubText(text:list[0].collageName, textSize: 16, color: Colors.black),
                      ],
                    ),
                  ),);
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
      )
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
