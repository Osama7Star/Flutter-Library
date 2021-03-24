import 'package:flutter/material.dart';
import 'package:flutter_library_new/Screens/Main/components/BookPage.dart';
import 'package:flutter_library_new/Screens/SuggestBook/Suggestbook.dart';
import 'package:flutter_library_new/Screens/authentication/signup/components/sign_form.dart';
import 'package:flutter_library_new/components/components.dart';
import 'package:flutter_library_new/components/coustme_bottom_nav_bar.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          ...List.generate(bookDemo.length,
                                  (index) => OnebookWidget(bookModel: bookDemo[index],numberOfbook: 1,))
                        ],
                      ),
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
