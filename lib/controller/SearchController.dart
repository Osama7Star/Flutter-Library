import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/models/ReadingBooksModel.dart';
import 'package:flutter_library_new/repository/book_repo.dart';
import 'package:flutter_library_new/repository/booksreading_repo.dart';
import 'package:flutter_library_new/repository/search_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:convert';

class SearchController extends ControllerMVC{




  Future<List<BookModel>> fetchSearch() async {
    try{
      final response = await fetchSearchR();
      print (response.statusCode);
      if (response.statusCode == 200) {

        var body =jsonDecode(response.body);
        List<BookModel> search =[];
        for ( var item in body)
        {
          search.add(BookModel.fromJson(item));
        }
        return search;
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
