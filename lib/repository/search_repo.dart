
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchSearchR() async {
  http.Response response =  await http.get(Config.apiUrl+"getsearchbook?access-token=test&text=");
  return response ;

}

