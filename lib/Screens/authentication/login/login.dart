import 'package:flutter/material.dart';
import 'package:flutter_library_new/Screens/authentication/signup/sign_up.dart';
import 'package:flutter_library_new/components/components.dart';

import 'components/login_form.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Image.asset("assets/images/logo.png"),
            LoginForm(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: SubText(text: 'Don\'t have account ? '),
            )
          ],
        ),
      ),
    );
  }
}
