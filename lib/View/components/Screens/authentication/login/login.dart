import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/signup/sign_up.dart';


import '../../../components.dart';
import 'components/login_form.dart';

class LogIn extends StatelessWidget {
  final String email ;
  final String password;
  static const routeName = '/login';

  const LogIn({Key key, this.email, this.password}) : super(key: key);

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
                text: "تسجيل دخول",
              ),
              LoginForm(email:"Osama.alnagem@gmail.com",password:"123"),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SubText(text: 'ليس لديك حساب ؟ تسجيل حساب جديد '),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
