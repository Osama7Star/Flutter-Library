import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;


Future<http.Response> signUpR(String fullName,String email,String password , String university,String collage) async {
  http.Response response =  await http.get(Config.apiUrl+"signup?access-token=test&fullName=$fullName&userName=$email&password=$password&universityName=$university&collageName=$collage");
  return response ;

}
Future<http.Response> loginR(String email,String password ) async {
  http.Response response =  await http.get(Config.apiUrl+"login?access-token=test&userName=$email&password=$password");
  return response ;

}