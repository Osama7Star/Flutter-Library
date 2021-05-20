import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/login/login.dart';


import '../../../components.dart';
import 'components/sign_form.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Image.asset(
                "assets/images/logo.png",
                width: 120,
                height: 120,
              ),
              SubText(
                text: "إنشاء حساب",
              ),
              SignUpForm(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: SubText(text: 'لديك حساب بالفعل ؟ تسجيل دخول '),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
