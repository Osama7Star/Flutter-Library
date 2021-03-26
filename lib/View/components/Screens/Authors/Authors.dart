import 'package:flutter/material.dart';

import 'package:flutter_library_new/models/AuthorModel.dart';

import 'AuthorInformation.dart';


import 'package:flutter_library_new/View/components/Screens/BookInfo/BookInfo.dart';





import '../../components.dart';
class Authros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar11(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                  AuthorDemo.length,
                  (index) => AuthorInfo(
                        authorInfo: AuthorDemo[index],
                      ))
            ],
          ),
        ));
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
                    child: BookImage(imageUrl: authorInfo.authroImage)),
                SubText(text: authorInfo.authorName, textSize: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
