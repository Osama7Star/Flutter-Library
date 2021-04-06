import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/CategoryBooks/CategoryBooks.dart';

import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/utilites/constants.dart';

import '../../../components.dart';

class category_list extends StatelessWidget {
  final CategoryModel categoryModel;

  const category_list({Key key, this.categoryModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData;
     double screenWidth;

    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell (


        onTap: (){
          print('testasdasd');

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryBooks11()),
          );
        },
        child: Container(
          width: screenWidth-10,
          height: 50,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(4),

          ),
          child:Center(child: SubText(text:cat0,color: Colors.white,))
        ),
      ),
    );
  }
}
