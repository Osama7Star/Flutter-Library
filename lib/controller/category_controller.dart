import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/repository/book_repo.dart';
import 'package:flutter_library_new/repository/category_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:convert';

class CategoryController extends ControllerMVC{




Future<List<CategoryModel>> fetchCategories({int numberOfCategories=6}) async {
  try{
    final response = await fetchCategoriesR(numberOfCategories: numberOfCategories);
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

Future<List<BookModel>> fetchCategoryBooks(String categoryId) async {
  try{
    final response = await fetchCategoryBooksR(categoryId);
    print (response.statusCode);
    if (response.statusCode == 200) {

      var body =jsonDecode(response.body);
      List<BookModel> books =[];
      for ( var item in body)
      {
        books.add(BookModel.fromJson(item));
      }
      return books;
    } else {

    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}




Future<List<CategoryModel>> fetchCategoryInfo(String categoryId) async {
  try{
    final response = await fetchCategoryInfoR(categoryId);
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
