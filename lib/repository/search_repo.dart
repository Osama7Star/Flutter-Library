
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

Future<http.Response> searchBooksR(String bookName) async {
  http.Response response =  await http.get("https://api.afropolicy.com/api/web/v1/recipes/getsearchbook?access-token=test&text=$bookName");
  return response ;


}
