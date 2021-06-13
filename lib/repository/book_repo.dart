
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
/// FETCH BOOK'S INFORMATION BY ISBN
Future<http.Response> fetchBookByISBNR(String ISBN) async {
  http.Response response =  await http.get("https://api.afropolicy.com/api/web/v1/recipes/getbookbyisbn?access-token=test&ISBN=$ISBN");
  return response ;


}

/// FETCH BOOK'S BORROWING INFORMATION BY ID
Future<http.Response> fetchBorrowingInfoR(String bookId) async {
  http.Response response =  await http.get("https://api.afropolicy.com/api/web/v1/recipes/getborrowedinfo?access-token=test&bookId=$bookId");
  return response ;


}

/// SUGGEST BOOK
Future<http.Response> suggestBookR(String bookName,String bookAuthor,String note) async {
  http.Response response =  await http.get("https://api.afropolicy.com/api/web/v1/recipes/getsuggestedbook?access-token=test&bookName=$bookName&authorName=$bookAuthor&note=$note");
  return response ;


}

/// BORROW BOOK

Future<http.Response> borrowBookR(String bookId,String userId) async {
  http.Response response =  await http.get((Config.apiUrl+"addbookborrowing?access-token=test&userId=$userId&bookId=$bookId"));
  return response ;


}
Future<http.Response> changeStatusR(String bookId,String userId,String bookStatus) async {
  http.Response response =  await http.get((Config.apiUrl+"updatebookstatus?access-token=test&userId=$userId&bookId=$bookId&bookStatus=$bookStatus"));
  return response ;


}



/// GET THE LAST ADDED BOOKS
Future<http.Response> getLastBooksR() async {
  http.Response response =  await http.get((Config.apiUrl+"getlastbooks?access-token=test"));
  return response ;


}




