import 'package:flutter_library_new/models/AuthorModel.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/models/QuoteModel.dart';
import 'package:flutter_library_new/repository/author_repo.dart';
import 'package:flutter_library_new/repository/book_repo.dart';
import 'package:flutter_library_new/repository/quote_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:convert';

class AuthorController extends ControllerMVC{




  Future<List<AuthorModel>> fetchAuthors() async {
    try{
      final response = await fetchAuthorsR();
      print (response.statusCode);
      if (response.statusCode == 200) {

        var body =jsonDecode(response.body);
        List<AuthorModel> authors =[];
        for ( var item in body)
        {
          authors.add(AuthorModel.fromJson(item));
        }
        return authors;
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
