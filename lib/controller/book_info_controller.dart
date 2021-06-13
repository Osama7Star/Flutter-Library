import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/BorrowingModel.dart';
import 'package:flutter_library_new/repository/book_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:convert';

class BookInfoController extends ControllerMVC{
List<BookModel> books = <BookModel>[];

BookInfoController()
{}

Future<void> ListenForBook ()async
{
  // final Stream<BookModel> stream = await getBook();
  // stream.listen((BookModel _book) {
  //   setState(() => books.add(_book));
  // }, onError: (a) {
  //   print(a);
  // }, onDone: () {});
}


Future<List<BookModel>> fetchBook() async {
  try{
    final response = await fetchBookR();
    print (response.statusCode);
    if (response.statusCode == 200) {

      // If the server did return a 200 OK response,
      // then parse the JSON.
      var body =jsonDecode(response.body);
      List<BookModel> books =[];

      for ( var item in body)
      {
        books.add(BookModel.fromJson(item));
      }
      return books;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  throw Exception('Failed to load book');
    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}


Future<List<BookModel>> fetchSimilarBooks(String categoryId) async {
  try{
    final response = await fetchSimilarBooksR(categoryId);
    print (response.statusCode);
    if (response.statusCode == 200) {

      var body =jsonDecode(response.body);
      List<BookModel> books =[];
      for ( var item in body)
      {
        books.add(BookModel.fromJson(item));
      }
      return books;
    } else {

    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}
///
Future<List<BookModel>> fetchSimilarBookss(String bookId) async {
  try{
    final response = await fetchSimilarBooksR(bookId);
    print (response.statusCode);
    if (response.statusCode == 200) {

      var body =jsonDecode(response.body);
      List<BookModel> books =[];
      for ( var item in body)
      {
        books.add(BookModel.fromJson(item));
      }
      return books;
    } else {

    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}
///
Future<List<BookModel>> fetchCategory1Books(String categoryId) async {
  try{
    /// TODO:CHANGE THIS
    final response = await fetchSimilarBooksR(categoryId);
    print (response.statusCode);
    if (response.statusCode == 200) {

      var body =jsonDecode(response.body);
      List<BookModel> books =[];
      for ( var item in body)
      {
        books.add(BookModel.fromJson(item));
      }
      return books;
    } else {

    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}


Future<List<BookModel>> fetchBookById(String bookId) async {
  try{
    final response = await fetchBookByIdR(bookId);

    print (response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var body =jsonDecode(response.body);
      List<BookModel> books =[];
      for ( var item in body)
      {
        books.add(BookModel.fromJson(item));
      }
      return books;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  throw Exception('Failed to load book');
    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}


/// GET BOOK INFO BY ISBN

Future<List<BookModel>> fetchBookByISBN(String ISBN) async {
  try{
    final response = await fetchBookByISBNR(ISBN);

    print (response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var body =jsonDecode(response.body);
      List<BookModel> books =[];
      for ( var item in body)
      {
        books.add(BookModel.fromJson(item));
      }
      return books;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  throw Exception('Failed to load book');
    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}
///

///
/// GET BOOK INFO BY ISBN
/// FETCH BOOK'S BORROWING INFORMATION BY ID
Future<List<BorrowingModel>> fetchBorrowingInfo(String bookId) async {
  try{
    final response = await fetchBorrowingInfoR(bookId);

    print (response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var body =jsonDecode(response.body);
      List<BorrowingModel> borrowingInfo =[];
      for ( var item in body)
      {
        borrowingInfo.add(BorrowingModel.fromJson(item));
      }
      return borrowingInfo;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  throw Exception('Failed to load book');
    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}
///

  Future<String> suggestBook(String bookName,String bookAuthor,String note) async {
    try{
      final response = await suggestBookR(bookName,bookAuthor,note);

      print (response.statusCode);
      if (response.statusCode == 200) {
        return "True";
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        //  throw Exception('Failed to load book');
      }
    }
    catch(e)
    {
      print("error is $e");
    }
    return null;

  }

Future<String> borrowBook(String bookId,String userId) async {
  try{
    final response = await borrowBookR(bookId,userId);

    print (response.statusCode);
    if (response.statusCode == 200) {
      return "True";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  throw Exception('Failed to load book');
    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}


Future<String> changeStatus(String bookId,String userId,String status) async {
  try{
    final response = await changeStatusR(bookId,userId,status);

    print (response.statusCode);
    if (response.statusCode == 200) {
      return "True";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  throw Exception('Failed to load book');
    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}


///GET THE LAST ADDED BOOKS



Future<List<BookModel>> fetchLastAddedBooks() async {
  try{
    final response = await getLastBooksR();

    print (response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var body =jsonDecode(response.body);
      List<BookModel> books =[];
      for ( var item in body)
      {
        books.add(BookModel.fromJson(item));
      }
      return books;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  throw Exception('Failed to load book');
    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}



/// GET THE MOST RATED BOOKS
///
///
Future<List<BookModel>> fetchMostRatedBooks() async {
  try{
    final response = await getMostRatedR();

    print (response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var body =jsonDecode(response.body);
      List<BookModel> books =[];
      for ( var item in body)
      {
        books.add(BookModel.fromJson(item));
      }
      return books;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  throw Exception('Failed to load book');
    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}

/// GET THE MOST READED BOOKS

Future<List<BookModel>> fetchMostReadedBooks() async {
  try{
    final response = await getMostReadedR();

    print (response.statusCode);
    if (response.statusCode == 200) {

      // If the server did return a 200 OK response,
      // then parse the JSON.
      var body =jsonDecode(response.body);
      List<BookModel> books =[];
      for ( var item in body)
      {
        books.add(BookModel.fromJson(item));
      }
      return books;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  throw Exception('Failed to load book');
    }
  }
  catch(e)
  {
    print("error is $e");
  }
  return null;

}


}
