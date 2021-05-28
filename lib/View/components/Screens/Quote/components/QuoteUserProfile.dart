import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/User/UserPage.dart';
import 'package:flutter_library_new/models/QuoteModel.dart';
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
          MaterialPageRoute(builder: (context) => UserPage(userId:quoteModel.userId )),
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