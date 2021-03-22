import 'package:flutter/material.dart';
import 'package:flutter_library_new/components/components.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';

import 'components/cateory_list.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar11(context),

      body: SingleChildScrollView(
        child: SizedBox(
          child: Row(
            children: [
              Container(
                  child: Container(
                child:  Column(
                  children: [
                    ...List.generate(categoryDemo.length,
                            (index) => category_list(categoryModel: categoryDemo[index])),
                  ],
                )
              )),
            ],
          ),
        ),
      ),
    );
  }
}
