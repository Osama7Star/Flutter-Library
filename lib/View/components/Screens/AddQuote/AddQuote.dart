import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/signup/components/sign_form.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';

class AddQuote extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar11(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Form(
              key: _formKey,

              child: NameInputField(
                hint: " إدخل الإقتياس",
                minChar: 2,
                emptyErroMessage: "الرجاء إدخل كلمة الإقتباس",
                lengehtErroMessage:
                "الإقتباس يجب أن يكون أكثر من حرفين ",
                icon: Icons.format_quote,
                label: "",
                isSearch: true,
              ),
            ),
            SizedBox(height: 10),
            Button(
                text: "إبحث",
                peiece: 1,
                pressed: () {
                  if (_formKey.currentState.validate()) {
                    print('Good the quote is taken');
                  }
                }),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),

    );
  }
}
