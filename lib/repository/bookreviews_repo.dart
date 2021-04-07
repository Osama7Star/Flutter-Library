
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchBookReviewss() async {
  http.Response response =  await http.get(Config.apiUrl+"getbookreview1?access-token=test&bookid=40");
  return response ;

}

