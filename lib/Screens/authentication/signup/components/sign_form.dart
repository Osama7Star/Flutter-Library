import 'package:flutter/material.dart';
import 'package:flutter_library_new/Screens/authentication/login/components/login_form.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              NameInputField(),
              SizedBox(height: 15),
              EmailInputField(),
              SizedBox(height: 10),
              PasswordInputField(),
              SizedBox(height: 15),
              Button(
                  text: "Sign Up ",
                  pressed: () {
                    if (_formKey.currentState.validate())
                      print("Working");
                    else
                      print("Not Working");
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class NameInputField extends StatelessWidget {
  const NameInputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty) return "Name is Empety";

        return null;
      },
    );
  }
}
