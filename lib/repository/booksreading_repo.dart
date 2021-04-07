
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchReadingBooksR() async {
  http.Response response =  await http.get(Config.apiUrl+"getbooksborrowingrecords?access-token=test");
  return response ;

}

