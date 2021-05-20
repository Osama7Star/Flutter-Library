
import 'package:flutter_library_new/utilites/config.dart';
import 'package:http/http.dart' as http;

 Future<http.Response> fetchBookR() async {
  http.Response response =  await http.get("https://api.afropolicy.com/api/web/v1/recipes/getbookbyid?access-token=test&bookId=40");
      return response ;


 }

Future<http.Response> fetchSimilarBooksR(String bookId) async {
  http.Response response =  await http.get(Config.apiUrl+"getcategorybook?access-token=test&categoryid=$bookId");
  return response ;


}
Future<http.Response> fetchCategorybook() async {
  http.Response response =  await http.get(Config.apiUrl+"getbooks?access-token=test");
  return response ;


}

Future<http.Response> fetchCategory1BooksR() async {
  http.Response response =  await http.get(Config.apiUrl+"getcategory1books?access-token=test&");
  return response ;


}

/// FETCH BOOK'S INFORMATION BY BOOKID
Future<http.Response> fetchBookByIdR(String bookId) async {
  http.Response response =  await http.get("https://api.afropolicy.com/api/web/v1/recipes/getbookbyid?access-token=test&bookId=$bookId");
  return response ;


}

/// SUGGEST BOOK
Future<http.Response> suggestBookR(String bookName,String bookAuthor,String note) async {
  http.Response response =  await http.get("https://api.afropolicy.com/api/web/v1/recipes/getsuggestedbook?access-token=test&bookName=$bookName&authorName=$bookAuthor&note=$note");
  return response ;


}


