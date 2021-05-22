
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchBookReviewss(String bookId) async {
  http.Response response =  await http.get(Config.apiUrl+"getbookreview1?access-token=test&bookid=$bookId");
  return response ;


}


/// GET REVIEWS FOR USER BY USERID
Future<http.Response> fetchUserReviewsR(String userId) async {
  http.Response response =  await http.get(Config.apiUrl+"getuserreviews?access-token=test&userId=$userId");
  return response ;


}

