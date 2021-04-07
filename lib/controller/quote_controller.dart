import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/models/QuoteModel.dart';
import 'package:flutter_library_new/repository/book_repo.dart';
import 'package:flutter_library_new/repository/quote_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:convert';

class QuoteController extends ControllerMVC{




  Future<List<QuoteModel>> fetchQuotes() async {
    try{
      final response = await fetchQuotesR();
      print (response.statusCode);
      if (response.statusCode == 200) {

        var body =jsonDecode(response.body);
        List<QuoteModel> quotes =[];
        for ( var item in body)
        {
          quotes.add(QuoteModel.fromJson(item));
        }
        return quotes;
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
