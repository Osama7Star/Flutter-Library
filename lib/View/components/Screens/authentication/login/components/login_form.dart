import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/Main/main_page.dart';
import 'package:flutter_library_new/controller/authentication_controller.dart';
import 'package:flutter_library_new/utilites/constants.dart';

import '../../../../components.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key, this.email, this.password}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
  final String email ;
  final String password ;

}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  AuthenticationController _con = new AuthenticationController();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            EmailInputField(
              controller: emailController,
            ),
            SizedBox(height: 10),
            PasswordInputField(
              controller: passwordController,
            ),
            SizedBox(height: 15),
            Button(
              text: "تسجيل الدخول ",
              pressed: () async{
                if (_formKey.currentState.validate())
                  {
                  //   bool loggedIn = await _con.login(emailController.text, passwordController.text);
                  //
                  //   if(loggedIn)
                  //     print("true");
                  //   else
                  //     print("false");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                   }

                else
                  print("Not Working");
              },
              peiece: 1,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({
    Key key,
    this.controller,
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(

        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.lock, color: kPrimaryColor),

          labelText: "كلمة السر",
          hintText: "كلمة السر",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        validator: (value) {
          if (value.isEmpty)
            return "كلمة السر لا يمكن أن تكون فارغة";
          else if (value.length < 5)
            return "كلمة السر لا يجب أن تكون أصغر من 5 أحرف ";
          return null;
        },
      ),
    );
  }
}

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    Key key,
    this.controller,
  }) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      suffixIcon: Icon(Icons.mail, color: kPrimaryColor),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.0),
      ),
      labelText: "إيميل",
      hintText: "ali@mail.com",
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );
    var textFormField = TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: inputDecoration,
      validator: (value) {
        if (value.isEmpty)
          return "لا يمكن أن يكون الإيميل فارغ";
        else if (!emailValidatorRegExp.hasMatch(value))
          return "الإيميل غير صحيح ";
        return null;
      },
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: textFormField,
    );
  }
}
