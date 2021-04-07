import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/repository/book_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:convert';

class CategoryController extends ControllerMVC{




Future<List<CategoryModel>> fetchCategories() async {
  try{
    final response = await fetchBookR();
    print (response.statusCode);
    if (response.statusCode == 200) {

      var body =jsonDecode(response.body);
      List<CategoryModel> categories =[];
      for ( var item in body)
      {
        categories.add(CategoryModel.fromJson(item));
      }
      return categories;
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
