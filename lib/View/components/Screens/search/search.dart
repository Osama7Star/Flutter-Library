import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/Main/components/BookPage.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/signup/components/sign_form.dart';
import 'package:flutter_library_new/controller/SearchController.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SearchController _con1 = SearchController();

  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar11(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      NameInputField(
                        hint: " إبحث",
                        minChar: 2,
                        emptyErroMessage: "الرجاء إدخل كلمة البحث",
                        lengehtErroMessage:
                            "إسم الكلية يجب أن يكون أكثر من 2 أحرف",
                        icon: Icons.search,
                        label: "",
                        isSearch: true,
                      ),
                      SizedBox(height: 10),
                      Button(
                          text: "إبحث",
                          peiece: 1,
                          pressed: () {
                            if (_formKey.currentState.validate()) {
                              setState(() {

                                isSearch= true;                            });
                            } else
                              print('Error');
                          }),

                  SizedBox(height: 20,),
                  if (isSearch)
                    FutureBuilder(
                      future: _con1.fetchSearch(),
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
                                  return snapshot.data.length>0? OnebookWidget(
                                      bookModel: list[index], numberOfbook: 1)
                                  :Text('لا يوجد كتاب');
                                }),
                          );
                        } else if (snapshot.hasError) {
                          return Text("Error");
                        }

                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      },
                    ),


                    ],
                  ),
                )),
          ),
        ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
