import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/AddQuote/components/not_logged.dart';
import 'package:flutter_library_new/utilites/enums.dart';
import 'package:flutter_library_new/utilites/functions.dart';
import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'components/is_logged.dart';

class SuggestBook extends StatelessWidget {
  String name   = '';
  String userId = '';
  String status = '';
  static const routeName = '/suggestbook';

  final String test;

   SuggestBook({Key key, this.test}) : super(key: key);
  @override
  void initState() {

    name   = UserSimplePreferences.getName()   ?? '';
    userId = UserSimplePreferences.getUserId() ?? '';
    status = UserSimplePreferences.getStatus() ?? '';
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: MyAppBar(context),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
              status != "1"?
              NotLogged(text: 'الرجاء تسجيل الدخول حتى تتمكن من إقتراح كتاب'):
              IsLogged()
          )),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
