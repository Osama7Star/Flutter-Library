
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

 Future<http.Response> fetchBookR() async {
  http.Response response =  await http.get("https://api.afropolicy.com/api/web/v1/recipes/getbookbyid?access-token=test&bookId=40");
      return response ;


 }

