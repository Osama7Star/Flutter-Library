
import 'package:flutter_library_new/models/UserModel.dart';
import 'package:flutter_library_new/repository/slider_repo.dart';
import 'package:flutter_library_new/repository/user_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:convert';
class UserController extends ControllerMVC{

  Future<List<UserModel>> fetchUser(String userId) async {
    try{
      final response = await fetchUserR(userId);
      print (response.statusCode);
      if (response.statusCode == 200) {

        var body =jsonDecode(response.body);
        List<UserModel> slider =[];
        for ( var item in body)
        {
          slider.add(UserModel.fromJson(item));
        }
        return slider;
      } else {

      }
    }
    catch(e)
    {
      print("error is $e");
    }
    return null;

  }

}