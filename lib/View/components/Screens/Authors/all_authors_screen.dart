import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/authors_controller.dart';
import 'package:flutter_library_new/models/AuthorModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'author_information_screen.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Book_Info_Screen.dart';
import '../../components.dart';
import 'Components/components.dart';

/// SHOW ALL THE AUTHORS
class AllAuthorsScreen extends StatelessWidget {
  AuthorController _con1 = AuthorController();
  static const routeName = '/all_author';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(context),
        body: SingleChildScrollView(
          child: FutureBuilder(
          future: _con1.fetchAuthors(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                List<AuthorModel> list = snapshot.data;
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),

                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return AuthorInfoWidget(authorInfo: list[index]);
                      }),
                );
            } else if (snapshot.hasError) {
             return Text("Error");
            }

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ),
        ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),

    );
  }
}
