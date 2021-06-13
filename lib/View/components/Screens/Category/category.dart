import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/category_controller.dart';

import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'components/cateory_list.dart';

class Category extends StatelessWidget {
  CategoryController _con= CategoryController();
  static const routeName = '/category';
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
          appBar: MyAppBar(context),
          body: SingleChildScrollView(
            child: Column(
              children: [


                FutureBuilder(
                  future: _con.fetchCategories(numberOfCategories: 30),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CategoryModel> list = snapshot.data;
                      return Container(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),

                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return category_list(
                                  categoryModel: list[index]);
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error");
                    }

                    // By default, show a loading spinner.

                    /// TO DO CHANGE THE POSITION OF THE PROGRESSBAR AND REPALCE IT WITH NICE ANIMATION
                    return SizedBox(
                      height: 500,
                      child: Container(
                        child: Align(
                          alignment: AlignmentDirectional.center,
                            child: CircularProgressIndicator()),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
