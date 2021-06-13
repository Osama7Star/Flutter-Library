
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchCategoriesR({int numberOfCategories = 6}) async {
  http.Response response =  await http.get(Config.apiUrl+"getcategories?access-token=test&numbercategories=$numberOfCategories");
  return response ;

}


Future<http.Response> fetchCategoryBooksR(String categoryId) async {
  http.Response response =  await http.get(Config.apiUrl+"getcategorybook?access-token=test&categoryid=$categoryId");
  return response ;

}
Future<http.Response> fetchCategoryInfoR(String categoryId) async {
  http.Response response =  await http.get(Config.apiUrl+"getcategoryname?access-token=test&categoryId=$categoryId");
  return response ;

}
