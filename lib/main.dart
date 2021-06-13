import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_library_new/utilites/SizeConfig.dart';
import 'package:flutter_library_new/utilites/functions.dart';
import 'package:flutter_library_new/utilites/routes.dart';

import 'View/components/Screens/BookInfo/Book_Info_Screen.dart';
import 'View/components/Screens/Main/main_page.dart';
import 'View/components/Screens/authentication/signup/sign_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserSimplePreferences.init();
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
      routes: routes,
      home:MainPage (),
    );
  }
}
