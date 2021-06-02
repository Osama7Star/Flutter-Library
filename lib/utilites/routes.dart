import 'package:flutter/widgets.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Book_Info_Screen.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/login/login.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  BookInfo.routeName: (context) => BookInfo(),
  LogIn.routeName: (context) => LogIn(),

};
