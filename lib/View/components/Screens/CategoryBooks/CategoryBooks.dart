import 'package:flutter/material.dart';
import 'package:flutter_library_new/controller/category_controller.dart';
import '../BookInfo/BookPage.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import 'package:flutter_library_new/utilites/enums.dart';
import '../../components.dart';
import 'package:flutter_library_new/models/BookModel.dart';

import '../../coustme_bottom_nav_bar.dart';

class CategoryBooks extends StatelessWidget {
  CategoryController _con1 = CategoryController();

  final String categoryId;
  final String categoryName;

   CategoryBooks({Key key, this.categoryId, this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar11(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,

              child: Card(
                  color: kPrimaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SubText(
                      text: categoryName,
                      textSize: 22,
                      color: kSecondPrimaryColor,
                    ),
                  )),
            ),

            ///TODO: SINGLECHILD SCROLL VIEW NOT WORKING
            FutureBuilder(
              future: _con1.fetchCategoryBooks(categoryId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<BookModel> list = snapshot.data;
                  return Container(
                    height: double.maxFinite,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),

                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return onBookWidget(
                              bookModel: list[index], numberOfbook: 1);
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),

    );
  }
}
