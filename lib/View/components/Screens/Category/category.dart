import 'package:flutter/material.dart';

import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
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
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.category),

    );
  }
}
