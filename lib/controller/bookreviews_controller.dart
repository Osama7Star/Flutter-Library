import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/BookReviewsModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/repository/book_repo.dart';
import 'package:flutter_library_new/repository/bookreviews_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:convert';

class BookReviewsController extends ControllerMVC{




  Future<List<BookReviewsModel>> fetchBookReviews() async {
    try{
      final response = await fetchBookReviewss();

      print (response.statusCode);
      if (response.statusCode == 200) {

        var body =jsonDecode(response.body);

        List<BookReviewsModel> bookReviews =[];
        for ( var item in body)
        {
          bookReviews.add(BookReviewsModel.fromJson(item));
        }
        print("The Book Lengeth is $bookReviews.length");
        return bookReviews;
      } else {

      }
    }
    catch(e)
    {
      print("error is $e");
    }

  }

}
