
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchAuthorsR() async {
  http.Response response =  await http.get(Config.apiUrl+"getauthors?access-token=test");
  return response ;

}

