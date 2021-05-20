import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/Main/main_page.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/login/components/login_form.dart';
import 'package:flutter_library_new/controller/authentication_controller.dart';

import 'package:flutter_library_new/utilites/constants.dart';

import '../../../../components.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  AuthenticationController _con = new AuthenticationController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController universityController = new TextEditingController();
  TextEditingController collageController = new TextEditingController();
  bool isClicked=false;
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
                  controller: nameController,
                  hint: "محمد علي",
                  label: "الإسم ",
                  minChar: 5,
                  emptyErroMessage: "الإسم لا يمكن أن يكون فارغ",
                  lengehtErroMessage: "الإسم يجب أن يكون أكثر من 5  أحرف",
                  icon: Icons.person),
              SizedBox(height: 15),
              EmailInputField(
                controller: emailController,
              ),
              SizedBox(height: 10),
              PasswordInputField(
                controller: passwordController,
              ),
              SizedBox(height: 10),
              NameInputField(
                  controller: universityController,
                  hint: "يلدز تكنك",
                  label: " الجامعة",
                  minChar: 5,
                  emptyErroMessage: "إسم الجامعة لا يمكن أن يكون فارغا",
                  lengehtErroMessage: "إسم الجامعة يجب أن يكون أكثر من 4 أحرف",
                  icon: Icons.apartment),
              SizedBox(height: 10),
              NameInputField(
                controller: collageController,
                hint: "كلية هندسة الحاسوب",
                label: "الكلية ",
                minChar: 5,
                emptyErroMessage: "إسم الكلية لا يمكن أن يكون فارغا",
                lengehtErroMessage: "إسم الكلية يجب أن يكون أكثر من 4 أحرف",
                icon: Icons.apartment,
              ),
              SizedBox(height: 15),
           Stack(
             children: [
               Button(
                   text: "إنشاء حساب ",
                   peiece: 1,
                   height: 50,
                   pressed: () async {
                     if (_formKey.currentState.validate()) {
                 String correct =  await     _con.signUp(
                           nameController.text,
                           emailController.text,
                           passwordController.text,
                           universityController.text,
                           collageController.text);

                 if (correct.isNotEmpty)
                   {
                     print('works ');
                   }
                 else{
                   print('not works');
                 }
                       setState(() {
                         isClicked = true;



                       });
                     } else {}
                   }),
               if (isClicked)
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Positioned(

                      child: Center(child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(kSecondPrimaryColor),
                      ),)
                   ),
                 ),
             ],
           )



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
    this.isSearch: false,
    Key key,
    this.couldBeEmpty: false,
    this.controller,
  }) : super(key: key);

  final String hint;
  final String label;
  final int minChar;
  final String emptyErroMessage;
  final String lengehtErroMessage;
  final IconData icon;
  final bool isSearch;
  final bool couldBeEmpty;

  final controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        textInputAction: isSearch ? TextInputAction.search : TextInputAction.go,
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
          if (!couldBeEmpty) {
            if (value.isEmpty) return emptyErroMessage;
            if (value.length < minChar) return '$lengehtErroMessage  $minChar';
          }
          return null;
        },
      ),
    );
  }
}

class NoteInputField extends StatelessWidget {
  const NoteInputField({
    @required this.hint,
    @required this.icon,
    Key key,
    this.controller,
  }) : super(key: key);

  final String hint;

  final IconData icon;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        child: Container(
          height: 100,
          child: TextFormField(
            controller: controller,
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
              hintText: hint,

              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('controller', controller));
  }
}
