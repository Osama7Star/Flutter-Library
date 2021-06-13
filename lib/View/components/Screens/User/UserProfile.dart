import 'package:flutter/material.dart';
import 'package:flutter_library_new/utilites/enums.dart';
import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'UserPage.dart';

class profilePage extends StatefulWidget {
  @override
  profilePageState createState() => profilePageState();
}

class profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MyAppBar(context),
        body: UserPage(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
}
