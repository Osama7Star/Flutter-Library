import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/models/ReadingBooksModel.dart';
import 'package:flutter_library_new/repository/book_repo.dart';
import 'package:flutter_library_new/repository/booksreading_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:convert';

class ReadingBooksController extends ControllerMVC{




  Future<List<ReadingBooksModel>> fetchReadingBooks() async {
    try{
      final response = await fetchReadingBooksR();

      if (response.statusCode == 200) {

        var body =jsonDecode(response.body);
        List<ReadingBooksModel> readingbooks =[];
        for ( var item in body)
        {
          readingbooks.add(ReadingBooksModel.fromJson(item));
        }
        return readingbooks;
      } else {

      }
    }
    catch(e)
    {
      print("error is $e");
    }
    return null;

  }

  /// GET THE BOOKS READED BY USER
  Future<List<ReadingBooksModel>> fetchUserReadingBooks(String userId) async {
    try{
      final response = await fetchUserReadingBooksR(userId);

      if (response.statusCode == 200) {

        var body =jsonDecode(response.body);
        List<ReadingBooksModel> readingbooks =[];
        for ( var item in body)
        {
          readingbooks.add(ReadingBooksModel.fromJson(item));
        }
        return readingbooks;
      } else {

      }
    }
    catch(e)
    {
      print("error is $e");
    }
    return null;

  }


}
