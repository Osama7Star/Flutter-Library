import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/signup/components/sign_form.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';

import '../../../components.dart';

class IsLogged extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController bookNameController = new TextEditingController();
  TextEditingController authorNameController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();
  BookInfoController _con1 = BookInfoController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          SubText(
            text: "إقترح كتاب",
            textSize: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  NameInputField(
                    controller: bookNameController,
                    hint: "إسم الكتاب",
                    minChar: 2,
                    emptyErroMessage: "الرجاء إدخال إسم الكتاب",
                    lengehtErroMessage:
                    "إسم الكلية يجب أن يكون أكثر من 2 أحرف",
                    icon: Icons.book,
                    label: "",
                  ),
                  SizedBox(height: 10),
                  NameInputField(
                    controller: authorNameController,
                    hint: "إسم الكاتب",
                    minChar: 2,
                    emptyErroMessage: "الرجاء إدخال إسم الكاتب",
                    lengehtErroMessage:
                    "إسم الكاتب يجب أن يكون أكثر من 2 أحرف",
                    icon: Icons.person,
                    label: "",
                  ),
                  SizedBox(height: 10),
                  NoteInputField(
                    controller: noteController,
                    hint: "ملاحظة",
                    icon: Icons.note,
                  ),
                  SizedBox(height: 10),
                  Button(
                      text: "إقترح",
                      peiece: 1,
                      pressed: () {
                        if (_formKey.currentState.validate()) {
                          Future<String> name = _con1.suggestBook(
                              bookNameController.text,
                              authorNameController.text,
                              noteController.text);
                          if (name.toString().isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("تم إضافة الاقتراح بنجاح"),
                              ),
                            );
                            print('added successfully${name.toString()}');
                          } else {
                            print('note added successfully$name');
                          }
                        } else
                          print('Error');
                      }),
                ],
              )),
        ],
      ),
    );
  }
}
