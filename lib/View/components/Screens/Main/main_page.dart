import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/AddQuote/add_quote.dart';
import 'package:flutter_library_new/View/components/Screens/Authors/All_Authors.dart';
import 'package:flutter_library_new/utilites/SizeConfig.dart';
import '../Authors/Components/components.dart';
import 'package:flutter_library_new/View/components/Screens/BookInfo/Book_Info_Screen.dart';
import 'package:flutter_library_new/View/components/Screens/Category/category.dart';
import 'package:flutter_library_new/View/components/Screens/Category/components/cateory_list.dart';
import 'package:flutter_library_new/controller/authors_controller.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/controller/category_controller.dart';
import 'package:flutter_library_new/models/AuthorModel.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import '../BookInfo/Components/one_book_widget.dart';

import 'components/CategoryNameLabel.dart';
import 'components/components.dart';
import 'components/getAuthorsW.dart';
import 'components/getBooksW.dart';
import 'components/getCategoriesW.dart';
import 'components/getCategorysBooks.dart';
import 'components/slider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _MainPageState();

  BookInfoController _con1 = BookInfoController();
  CategoryController _con2 = CategoryController();
  AuthorController _con3 = AuthorController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar11(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: missing_required_param
            Slider222(),
            SizedBox(height: 10),

            /// CATEGORY LABEL
            categorylabel(),

            /// START CATEGORY IS HERE
            getCategoriesW(con2: _con2),

            SizedBox(height: 40),

            /// MOST RATED

           SubText(text: 'كتب  '),
           getBooksW(con1: _con1),


            SizedBox(height: 5),
            GetCategoryBooks(con1: _con1, categoryId: "19",con2: _con2),

           // CategoryNameLabel(),
            SizedBox(height: 5),
            GetCategoryBooks(con1: _con1, categoryId: "20",con2: _con2),

            //CategoryNameLabel(),
            SizedBox(height: 5),
            GetCategoryBooks(con1: _con1, categoryId: "21",con2: _con2),


            // /// AUTHOR
            // SubText(text: 'الكٌتّاب '),
            // getAuthorsW(con3: _con3),
          ],
        ),
      )),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      floatingActionButton: floatingActionButtonW(),
    );
  }
}


