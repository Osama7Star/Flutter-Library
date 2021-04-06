import 'package:flutter_library_new/models/BookModel.dart';
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
    print ("the response is  ");
    print (response.statusCode);
    if (response.statusCode == 200) {
      print ("Fuck it's true");
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

}

}
