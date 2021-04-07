import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/Category/category.dart';
import 'package:flutter_library_new/View/components/Screens/Category/components/cateory_list.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
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
        SizedBox(
          height: 150,
          child: GridView.builder(itemCount:categoryDemo.length ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
                childAspectRatio: 3

          ), itemBuilder: (context,index)=>category_list(categoryModel: categoryDemo[index])),
        ),
            CategoryNameLabel(),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       ...List.generate(bookDemo.length,
            //           (index) => OnebookWidget(bookModel: bookDemo[index]))
            //     ],
            //   ),
            //
            // ),
            FutureBuilder(
              future: _con1.fetchCategory1Books(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<BookModel> list = snapshot.data;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return OnebookWidget(bookModel: list[index]);
                      });
                } else if (snapshot.hasError) {
                  return Text("Error");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),



          ],

        ),

      )
    ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),

    );
  }
}
