import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/BorrowingModel.dart';


import '../../../components.dart';

class NotAvilableWidget extends StatelessWidget {
  const NotAvilableWidget({
    Key key,
    @required BookInfoController con1,
    @required this.list,
  })
      : _con1 = con1,
        super(key: key);

  final BookInfoController _con1;
  final List<BookModel> list;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _con1.fetchBorrowingInfo(list[0].bookId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BorrowingModel> list = snapshot.data;

            return Align(
              alignment: Alignment.center,
              child: (RichText(
                text: TextSpan(
                    text: 'الكتاب غير متاح للإستعارة \n ',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  تم إستعارته من قبل ${list[0].fullName}  \n  ',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: ' حتى تاريخ  ${list[0].endDate}  ',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      )
                    ]),
              )),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}