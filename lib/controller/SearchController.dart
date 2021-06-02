import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/models/ReadingBooksModel.dart';
import 'package:flutter_library_new/repository/book_repo.dart';
import 'package:flutter_library_new/repository/booksreading_repo.dart';
import 'package:flutter_library_new/repository/search_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:convert';

class SearchController extends ControllerMVC {
  Future<List<BookModel>> searchBook(String bookName) async {
    List<BookModel> books = [];

    try {
      final response = await searchBooksR(bookName);

      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);


        for (var item in body) {
          books.add(BookModel.fromJson(item));
        }
        return books;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        //  throw Exception('Failed to load book');
      }
    } catch (e) {
      print("error is $e");
    }
    return books;
  }
}
