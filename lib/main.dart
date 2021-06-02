import 'package:flutter/material.dart';
import 'package:flutter_library_new/utilites/routes.dart';

import 'View/components/Screens/BookInfo/BookInfo.dart';
import 'View/components/Screens/Main/main_page.dart';
import 'View/components/Screens/authentication/signup/sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: MainPage(),
    );
  }
}
