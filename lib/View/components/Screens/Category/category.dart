import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/category_controller.dart';

import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'components/cateory_list.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoryController _con= CategoryController();

    return Scaffold(
      appBar:AppBar11(context),

      body: SingleChildScrollView(
        child: SizedBox(
          height: 10000,
          width: 200,
          child: Row(
            children: [
              Container(
                  child: Container(
                    width: 200,
                height: 1000,
                child:  FutureBuilder(
                  future:_con.fetchCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CategoryModel> fyck =snapshot.data;
                      return                   ListView.builder(
                          itemCount: snapshot.data.length,

                          itemBuilder: (context,index){
                      return  category_list(categoryModel:fyck[index]);
                      });

                    } else if (snapshot.hasError) {
                      return Text("Error");
                    }

                    // By default, show a loading spinner.
                    return Text('Errrrrrro');
                  },
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
