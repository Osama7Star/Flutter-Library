import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/signup/sign_up.dart';


import '../../../components.dart';
import 'components/login_form.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Image.asset(
              "assets/images/logo.png",
              width: 120,
              height: 120,
            ),
            SubText(
              text: "تسجيل دخول",
            ),
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
