import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;



Future<http.Response> fetchUserR(String userId) async {
http.Response response =  await http.get(Config.apiUrl+"getuserinformation?access-token=test&userid=$userId");
return response ;

}

