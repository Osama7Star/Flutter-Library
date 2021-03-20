import 'package:flutter/material.dart';
import 'package:flutter_library_new/Screens/authentication/login/login.dart';
import 'package:flutter_library_new/components/components.dart';

import 'components/sign_form.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            HeaderText(text: "Welcome To Sign Up page1"),
            SignUpForm(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              },
              child: SubText(text: 'Already have account ? Login'),
            )
          ],
        ),
      ),
    );
  }
}
