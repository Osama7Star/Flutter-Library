import 'package:flutter/material.dart';
import 'package:flutter_library_new/Screens/SuggestBook/Suggestbook.dart';
import 'package:flutter_library_new/Screens/authentication/signup/components/sign_form.dart';
import 'package:flutter_library_new/components/components.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar11(context),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    NameInputField(
                      hint: " إبحث",
                      minChar: 2,
                      emptyErroMessage: "الرجاء إدخل كلمة البحث",
                      lengehtErroMessage:
                          "إسم الكلية يجب أن يكون أكثر من 2 أحرف",
                      icon: Icons.search,
                      label: "",
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
                ),
              )),
        ));
  }


}
