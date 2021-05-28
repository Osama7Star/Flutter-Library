import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/User/UserPage.dart';
import 'package:flutter_library_new/models/QuoteModel.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import '../../../components.dart';
import 'QuoteUserProfile.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({
    @required this.quoteModel,
    Key key,
  }) : super(key: key);

  final QuoteModel quoteModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserPage(userId: quoteModel.userId),
            ),
          );
        },
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

            /// Quote is here
            Text(
              quoteModel.quote,
              style: textStyle,
            ),
            DateWidget(date: quoteModel.date),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
