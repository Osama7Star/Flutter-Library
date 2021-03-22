import 'package:flutter/material.dart';
import 'package:flutter_library_new/components/components.dart';
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
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
  }) : super(key: key);

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
