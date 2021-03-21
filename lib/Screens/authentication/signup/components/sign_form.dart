import 'package:flutter/material.dart';
import 'package:flutter_library_new/Screens/authentication/Main/main_page.dart';
import 'package:flutter_library_new/Screens/authentication/login/components/login_form.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              NameInputField(
                  hint: "محمد علي",
                  label: "الإسم ",
                  minChar: 5,
                  emptyErroMessage: "الإسم فارغ",
                  lengehtErroMessage: "الإسم يجب أن يكون أكثر من 3  أحرف",
                  icon: Icons.person),
              SizedBox(height: 15),
              EmailInputField(),
              SizedBox(height: 10),
              PasswordInputField(),
              SizedBox(height: 10),
              NameInputField(
                  hint: "إسطنبول | جراح باشا",
                  label: " الجامعة",
                  minChar: 5,
                  emptyErroMessage: "إسم الجامعة لا يمكن أن يكون فارغا",
                  lengehtErroMessage: "إسم الجامعة يجب أن يكون أكثر من 4 أحرف",
                  icon: Icons.apartment),
              SizedBox(height: 10),
              NameInputField(
                hint: "كلية هندسة الحاسوب",
                label: "الكلية ",
                minChar: 5,
                emptyErroMessage: "إسم الكلية لا يمكن أن يكون فارغا",
                lengehtErroMessage: "إسم الكلية يجب أن يكون أكثر من 4 أحرف",
                icon: Icons.apartment,
              ),
              SizedBox(height: 15),
              Button(
                  text: "Sign Up ",
                  pressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    } else
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
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
    @required this.hint,
    @required this.label,
    @required this.minChar,
    @required this.emptyErroMessage,
    @required this.lengehtErroMessage,
    @required this.icon,
    Key key,
  }) : super(key: key);

  final String hint;
  final String label;
  final int minChar;
  final String emptyErroMessage;
  final String lengehtErroMessage;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          suffixIcon: Icon(icon, color: kPrimaryColor),

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
          labelText: label,
          hintText: hint,

          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        validator: (value) {
          if (value.isEmpty) return emptyErroMessage;
          if (value.length < minChar) return '$lengehtErroMessage  $minChar';
          return null;
        },
      ),
    );
  }
}
