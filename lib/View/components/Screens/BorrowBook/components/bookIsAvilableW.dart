import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import 'package:flutter_library_new/utilites/functions.dart';

import '../../../components.dart';

class bookIsAvilableW extends StatefulWidget {
  @override
  _bookIsAvilableWState createState() => _bookIsAvilableWState();
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Functions.getDate()),
                SubText(text: 'تاريخ الإستعارة '),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    'إختر التاريخ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: kPrimaryColor,
                ),
                SubText(text: 'تاريخ الإرجاع '),
              ],
            ),
            SizedBox(height: 20),
            Text(selectedDate.toString()),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Button(
                  text: "إستعارة",
                  pressed: () {
                    _con1.borrowBook("100", "78");
                    _con1.changeStatus("100", "78");
                    print("Book Borrowing");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
