import 'package:flutter/material.dart';
import 'package:flutter_library_new/utilites/constants.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            EmailInputField(),
            SizedBox(height: 10),
            PasswordInputField(),
            SizedBox(height: 15),
            Button(
                text: "Log in ",
                pressed: () {
                  if (_formKey.currentState.validate())
                    print("Working");
                  else
                    print("Not Working");
                })
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key key, @required this.text, @required this.pressed})
      : super(key: key);

  final String text;
  final Function pressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FlatButton(
          onPressed: pressed,
          color: kPrimaryColor,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your Password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty)
          return "Password Emptey";
        else if (value.length < 5)
          return "Password can't be less than 5 letters";
      },
    );
  }
}

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty)
          return "Email is Empety";
        else if (!emailValidatorRegExp.hasMatch(value))
          return "Email is not true";
        return null;
      },
    );
  }
}
