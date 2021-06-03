import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Components/components.dart';
import 'package:flutter_library_new/controller/authors_controller.dart';
import 'package:flutter_library_new/models/AuthorModel.dart';

import '../../../components.dart';

class AuthorInfoHeader extends StatelessWidget {
  AuthorInfoHeader({
    Key key, this.authorId,
  }) : super(key: key);
  AuthorController   _con2 = AuthorController();
  final String authorId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _con2.fetchAuthorInformation(authorId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<AuthorModel> list = snapshot.data;
          return Center(
            child: SizedBox(
              width: double.infinity,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 250,
                      child: BookImage(imageUrl: list[0].imageUrl,imageHeight: 150,),
                    ),
                    SizedBox(height: 10),
                    SubText(text: list[0].authorName, textSize: 24),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SubText(
                            text:list[0].bio,
                            textSize: 14,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
