import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/BorrowingModel.dart';

import '../../../components.dart';

class NotAvilableWidget extends StatelessWidget {
  const NotAvilableWidget({
    Key key,
    @required BookInfoController con1,
    @required this.list1,
  })  : _con1 = con1,
        super(key: key);

  final BookInfoController _con1;
  final List<BookModel> list1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _con1.fetchBorrowingInfo(list1[0].bookId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BorrowingModel> list = snapshot.data;

            return list[0].userId == "78"
                ? Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(

                        children: [
                          SubText(text: 'إعادة الكتاب ', textSize: 25),

                          SubText(
                              text:
                                  'يبدو أنك  بالفعل مستعير لهذا الكتاب من قبل هل تريد إعادته ؟  '),
                          SizedBox(height: 20),
                          Button(text: "إعادة", pressed: () {
                            _con1.changeStatus(list1[0].bookId,list[0].userId ,"0");

                          }),
                        ],
                      ),
                    ),
                  )
                : Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: (RichText(
                          text: TextSpan(
                              text: 'الكتاب غير متاح للإستعارة \n ',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'تم إستعارته من قبل ',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: '  ${list[0].fullName}  \n  ',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: ' حتى تاريخ ',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                                TextSpan(
                                  text: ' ${list[0].endDate}  ',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        )),
                      ),
                    ),
                  );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
