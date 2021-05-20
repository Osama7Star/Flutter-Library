import 'package:flutter_library_new/models/AuthorModel.dart';
import 'package:flutter_library_new/repository/authentication_repo.dart';
import 'package:flutter_library_new/repository/author_repo.dart';

import 'dart:convert';

class AuthenticationController{
  Future<String> signUp(String fullName,String email,String password , String university,String collage) async {
    try{
      final response = await signUpR(fullName,email,password,university,collage);
      print (response.statusCode);
      if (response.statusCode == 200) {
        return "True";
      } else {
        return null ;
      }
    }
    catch(e)
    {
      print("error is $e");
    }
    return null;

  }
  Future<bool> login(String email,String password ) async {
    try{
      final response = await loginR(email,password);
      print (response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false ;
      }
    }
    catch(e)
    {
      print("error is $e");
    }
    return false;

  }
}




