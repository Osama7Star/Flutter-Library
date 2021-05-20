
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchAuthorsR() async {
  http.Response response =  await http.get(Config.apiUrl+"getauthors?access-token=test");
  return response ;

}


/// FETCH AUTHOR'S INFORMATION LIKE (NAMES, IMAGE ,BIO )
Future<http.Response> fetchAuthorInformationR(String authorId) async {
  http.Response response =  await http.get(Config.apiUrl+"getauthorinfo?access-token=test&authorId=$authorId");
  return response ;

}

/// FETCH AUTHOR'S INFORMATION LIKE (NAMES, IMAGE ,BIO )
Future<http.Response> fetchAuthorBooksR(String authorId) async {
  http.Response response =  await http.get(Config.apiUrl+"getauthorbooks1?access-token=test&authorid=$authorId");
  return response ;

}

