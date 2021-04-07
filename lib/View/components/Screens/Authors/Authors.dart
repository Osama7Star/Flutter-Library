import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/authors_controller.dart';

import 'package:flutter_library_new/models/AuthorModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../coustme_bottom_nav_bar.dart';
import 'AuthorInformation.dart';


import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';





import '../../components.dart';
class Authros extends StatelessWidget {
  AuthorController _con1 = AuthorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar11(context),
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
                  return AuthorInfo(authorInfo: list[index]);
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

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({
    Key key,
    this.authorInfo,
  }) : super(key: key);
  final AuthorModel authorInfo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthorInformation()),
        );
      },
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Card(
            child: Column(
              children: [
                SizedBox(
                    width: 200,
                    height: 200,
                    child: BookImage(imageUrl: authorInfo.imageUrl)),
                SubText(text: authorInfo.authorName, textSize: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
