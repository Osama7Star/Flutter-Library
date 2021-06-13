import 'package:flutter/widgets.dart';
import 'package:flutter_library_new/View/components/Screens/Authors/all_authors_screen.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Book_Info_Screen.dart';
import 'package:flutter_library_new/View/components/Screens/Category/category.dart';
import 'package:flutter_library_new/View/components/Screens/SuggestBook/suggest_book.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/login/login.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SuggestBook.routeName: (context) => SuggestBook(),
  Category.routeName: (context) => Category(),
  BookInfo.routeName: (context) => BookInfo(),
  LogIn.routeName: (context) => LogIn(),
  AllAuthorsScreen.routeName: (context) => AllAuthorsScreen(),
};
