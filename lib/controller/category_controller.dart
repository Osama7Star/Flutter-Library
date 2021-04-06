import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/repository/book_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:convert';

class CategoryController extends ControllerMVC{




Future<List<CategoryModel>> fetchCategories() async {
  try{
    final response = await fetchBookR();
    print ("the response is  ");
    print (response.statusCode);
    if (response.statusCode == 200) {
      print ("Fuck it's true");
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var body =jsonDecode(response.body);
      List<CategoryModel> categories =[];
      for ( var item in body)
      {
        categories.add(CategoryModel.fromJson(item));
      }
      return categories;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  throw Exception('Failed to load book');
    }
  }
  catch(e)
  {
    print("error is $e");
  }

}

}
