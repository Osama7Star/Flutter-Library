import 'package:flutter/material.dart';
import '../BookInfo/Components/one_book_widget.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/signup/components/sign_form.dart';
import 'package:flutter_library_new/controller/SearchController.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import 'components/book_not_found.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SearchController _con1 = SearchController();
  TextEditingController fieldController = new TextEditingController();

  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: MyAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  SubText(
                    text: "إبحث عن  كتاب",
                    textSize: 20,
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        NameInputField(
                          controller: fieldController,
                          hint: " أدخل إسم الكتاب",
                          minChar: 2,
                          emptyErroMessage: "الرجاء إدخل كلمة البحث",
                          lengehtErroMessage:
                              "إسم الكتاب يجب أن يكون أكثر من 2 أحرف",
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
                                  isSearch = true;
                                });
                              } else
                                print('Error');
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        if (isSearch)
                          FutureBuilder<List<BookModel>>(
                            future: _con1.searchBook(fieldController.text),
                            // function where you call your api
                            builder: (BuildContext context,
                                AsyncSnapshot<List<BookModel>> snapshot) {
                              List<BookModel > booksList = snapshot.data;

                              // AsyncSnapshot<Your object type>
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                if (snapshot.hasError)
                                  return Center(
                                      child: BookNotFound());
                                else
                                  return snapshot.data.length>0 ?
                                  Container(
                                    child: ListView.builder(
                                        physics:
                                        NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          return  OneBookWidget(
                                              bookModel: snapshot.data[index],
                                              numberOfbook: 1);

                                          /// TODO : SUGGEST BOOK
                                          /// TODO : BUTTON SEARCH IN KEYPAD

                                        }),
                                  ):
                                  BookNotFound(text: "الكتاب غير موجود هل تريد إقتراخه",); // snapshot.data  :- get your object which is pass from your downloadData() function
                              }
                            },
                          )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
