import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/signup/components/sign_form.dart';
import 'package:flutter_library_new/controller/quote_controller.dart';

import '../../../components.dart';
class IsLogged extends StatelessWidget {
  const IsLogged({
    Key key,
    @required this.name,
    @required GlobalKey<FormState> formKey,
    @required this.quoteController,
    @required QuoteController con1,
  }) : _formKey = formKey, _con1 = con1, super(key: key);

  final String name;
  final GlobalKey<FormState> _formKey;
  final TextEditingController quoteController;
  final QuoteController _con1;

  @override
  Widget build(BuildContext context) {
    return Column(


      children: [
        Text(name),
        Form(
          key: _formKey,
          child: NameInputField(
            controller: quoteController,
            hint: " إدخل الإقتياس",
            minChar: 2,
            emptyErroMessage: "الرجاء إدخل كلمة الإقتباس",
            lengehtErroMessage:
            "الإقتباس يجب أن يكون أكثر من حرفين ",
            icon: Icons.format_quote,
            label: "",
            isSearch: false,
          ),
        ),
        SizedBox(height: 10),
        Button(
            text: "أضف الإقتباس",
            peiece: 1,
            pressed: () {
              if (_formKey.currentState.validate()) {
                _con1.addQuote(quoteController.text, "73");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("تم إضافة الإقتباس  بنجاح"),
                  ),
                );
              }
            }),
      ],
    );
  }
}
