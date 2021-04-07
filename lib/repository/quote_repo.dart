
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchQuotesR() async {
  http.Response response =  await http.get(Config.apiUrl+"getquotes?access-token=test&");
  return response ;

}

