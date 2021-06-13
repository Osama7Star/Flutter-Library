import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Book_Info_Screen.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Components/components.dart';
import 'package:flutter_library_new/models/AuthorModel.dart';

import '../../../components.dart';
import '../author_information_screen.dart';



class AuthorInfoWidget extends StatelessWidget {
  const AuthorInfoWidget({
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
          MaterialPageRoute(

            builder: (context) => AuthorInformationScreen(authorId: authorInfo.authorId,),
          ),
        );
      },
      child: Center(
        child: Card(
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity  ,
                  height: 150,

                  child: BookImage(imageUrl: authorInfo.imageUrl,imageHeight:150)),
              SizedBox(height: 20,),
              SubText(text: authorInfo.authorName, textSize: 20),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
