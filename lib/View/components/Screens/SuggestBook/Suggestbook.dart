import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/signup/components/sign_form.dart';

import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';

class SuggestBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar11(context),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SubText(
                  text: "إقترح الكتاب",
                  textSize: 20,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        NameInputField(
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
                          hint: "ملاحظة",
                          icon: Icons.note,

                        ),
                        SizedBox(height: 10),
                        Button(
                            text: "إبحث",
                            peiece: 1,
                            pressed: () {
                              if (_formKey.currentState.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SuggestBook()),
                                );
                              } else
                                print('Error');
                            }),
                      ],
                    )),
              ],
            ),
          ),
        )),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),

    )
    ;
  }
}
