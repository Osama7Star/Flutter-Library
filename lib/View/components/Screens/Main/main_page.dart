import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/AddQuote/AddQuote.dart';
import 'package:flutter_library_new/View/components/Screens/Category/category.dart';
import 'package:flutter_library_new/View/components/Screens/Category/components/cateory_list.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/controller/category_controller.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import 'components/BookPage.dart';

import 'components/CategoryNameLabel.dart';
import 'components/slider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _MainPageState();
  BookInfoController _con1 = BookInfoController();
  CategoryController _con2 = CategoryController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar11(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: missing_required_param
            Slider222(),
            SizedBox(height: 10),
            //   Category(),
            GestureDetector(child: SubText(text: "التصنيفات",),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Category()),
              );
            }),
        // SizedBox(
        //   height: 250,
        //   child: GridView.builder(itemCount:categoryDemo.length ,
        //       shrinkWrap: true,
        //
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     mainAxisSpacing: 1,
        //         childAspectRatio: 3
        //
        //   ), itemBuilder: (context,index)=>category_list(categoryModel: categoryDemo[index])),
        // ),

            /////////////////////////
            FutureBuilder(
              future: _con2.fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<CategoryModel> list = snapshot.data;
                  return Container(
                    child:  GridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 1,
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(list.length, (index) {
                        return category_list(categoryModel: list[index]);
                      }),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
            SizedBox(height: 40),


            ////////////////////////
            /// TODO : MAKE A MARING BETWEEN THE LABAEL AND THE BOOKS LIST
            CategoryNameLabel(),
            SizedBox(height: 5),
            GetCategoryBooks(con1: _con1),

            CategoryNameLabel(),
            SizedBox(height: 5),
            GetCategoryBooks(con1: _con1),

            CategoryNameLabel(),
            SizedBox(height: 5),
            GetCategoryBooks(con1: _con1),



          ],

        ),

      )
    ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddQuote()),
          );
        },
        child: Icon(Icons.format_quote),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}

class GetCategoryBooks extends StatelessWidget {
  const GetCategoryBooks({
    Key key,
    @required BookInfoController con1,
  }) : _con1 = con1, super(key: key);

  final BookInfoController _con1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _con1.fetchCategory1Books(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<BookModel> list = snapshot.data;
          return Container(
            height: 300,
            margin: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return OnebookWidget(bookModel: list[index]);
                }),
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
