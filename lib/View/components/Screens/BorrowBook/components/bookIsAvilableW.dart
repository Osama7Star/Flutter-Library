import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import 'package:flutter_library_new/utilites/functions.dart';

import '../../../components.dart';

class bookIsAvilableW extends StatefulWidget {
  const bookIsAvilableW({Key key, this.bookId, this.userId}) : super(key: key);

  @override
  _bookIsAvilableWState createState() => _bookIsAvilableWState();
  final String bookId;
  final String userId;
}

class _bookIsAvilableWState extends State<bookIsAvilableW> {
  DateTime selectedDate = DateTime.now();
  BookInfoController _con1 = new BookInfoController();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      ///TODO:CHANGE IT TO BE FIRSTDATE IS CURRENT YEAR AND LASTDATE IS THE NEXT YEAR
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SubText(text: 'إستعارة', textSize: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Functions.getDate()),
                SubText(text: ' : تاريخ الإستعارة'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => _selectDate(context),
                    style: TextButton.styleFrom(
                      primary: kPrimaryColor,
                    ),
                    child:
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        SizedBox(width: 8),
                        Text(
                          'إختر التاريخ',
                          style: TextStyle(fontSize: 18),
                        ),

                      ],
                    )

                ),
              //  IconButton(icon: Icon(Icons.date_range,color: kPrimaryColor),   onPressed: () => _selectDate(context),),

                SubText(text: ' : تاريخ الإرجاع'),
              ],
            ),
            SizedBox(height: 20),
            //Text(selectedDate.toString()),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Button(
                  text: "إستعارة",
                  pressed: () async {
                    _con1.borrowBook(widget.bookId, "5555");
                String test =   await  _con1.changeStatus(widget.bookId, widget.userId, "1");
                print("The resut is$test");
                /// TODO : SHOW PROGRESSBAR AND CHECK IF IT WORKED PROPERLY
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

BorrowthisBook() async {
  BookInfoController _con1 = new BookInfoController();
String done = await  _con1.borrowBook("100", "78");

  _con1.changeStatus("100", "78", "1");
}
