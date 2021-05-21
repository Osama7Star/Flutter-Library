
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

/// GET QUOTES
Future<http.Response> fetchQuotesR() async {
  http.Response response =  await http.get(Config.apiUrl+"getquotes?access-token=test&");
  return response ;

}

Future<http.Response> addQuoteR(String quote,String userId) async {
  http.Response response =  await http.get(Config.apiUrl+"addquote?access-token=test&quote=$quote&userId=$userId");
  return response ;

}

/// GET USER QUOTES BY USERID
Future<http.Response> fetchUserQuotesR(String userId) async {
  http.Response response =  await http.get(Config.apiUrl+"getuserquotes?access-token=test&userId=$userId");
  return response ;

}






