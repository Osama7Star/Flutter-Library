import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/AddQuote/components/not_logged.dart';
import 'package:flutter_library_new/View/components/Screens/authentication/signup/components/sign_form.dart';
import 'package:flutter_library_new/controller/bookreviews_controller.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../components.dart';

Card AddReviewW(BookReviewsController _con,String status) {
  final _formKey = GlobalKey<FormState>();

  double userAdedRate = 0;
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          status =="1" ?NotLogged(text: 'الرجاء تسجيل الدخول حتى تتمكن من إضافة إقتباس') :
          Form(
              key: _formKey,
              child: Column(
                children: [
                  NameInputField(
                      hint: "أضف مراجعة",
                      minChar: 5,
                      emptyErroMessage: "إكتب شيئاً",
                      lengehtErroMessage: "الإسم يجب أن يكون أكثر من 3  أحرف",
                      icon: Icons.add,
                      couldBeEmpty: true),
                  SizedBox(height: 10),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: kSecondPrimaryColor,
                    ),
                    onRatingUpdate: (rating) {
                      userAdedRate = rating;
                    },
                  ),
                  SizedBox(height: 20),
                  Button(
                      text: "إضافة مراجعة",
                      pressed: () {
                        if (_formKey.currentState.validate() &&
                            userAdedRate != 0) {
                          _con.addReview(
                              "review from flutter", "5", "78", "100");
                        } else {
                          print("Error $userAdedRate");
                        }
                      })
                ],
              ))
        ],
      ),
    ),
  );
}