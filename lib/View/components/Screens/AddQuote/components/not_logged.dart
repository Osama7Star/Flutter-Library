import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/login/login.dart';

import '../../../components.dart';

class NotLogged extends StatelessWidget {
  const NotLogged({
    Key key, this.text,
  }) : super(key: key);

 @required final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SubText(text: text),
        SizedBox(height: 20),
        Button(text: 'تسجيل الدخول', pressed: (){
          Navigator.of(context).pushNamed(LogIn.routeName);           } )
      ],
    );
  }
}
