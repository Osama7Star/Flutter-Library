import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/quote_controller.dart';
import 'package:flutter_library_new/utilites/enums.dart';
import 'package:flutter_library_new/utilites/functions.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'components/is_logged.dart';
import 'components/not_logged.dart';

class AddQuote extends StatefulWidget {
  @override
  _AddQuoteState createState() => _AddQuoteState();
}

class _AddQuoteState extends State<AddQuote> {
  final _formKey = GlobalKey<FormState>();

  QuoteController _con1 = QuoteController();

  TextEditingController quoteController = new TextEditingController();

  String name = '';
  String userId = '';
  String status = '';

  @override
  void initState() {
    super.initState();
    UserSimplePreferences.setName("Osama");
    UserSimplePreferences.setStatus("1");
    UserSimplePreferences.setUserId("10");

    name = UserSimplePreferences.getName() ?? '';
    userId = UserSimplePreferences.getUserId() ?? '';
    status = UserSimplePreferences.getStatus() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: status != '1'
            ? NotLogged(text: 'الرجاء تسجيل الدخول حتى تتمكن من إضافة إقتباس')
            : IsLogged(
                name: name,
                formKey: _formKey,
                quoteController: quoteController,
                con1: _con1),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
