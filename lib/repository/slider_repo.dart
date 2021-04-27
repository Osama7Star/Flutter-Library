
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchSliderR() async {
  http.Response response =  await http.get(Config.apiUrl+"slider?access-token=test&text=");
  return response ;

}

