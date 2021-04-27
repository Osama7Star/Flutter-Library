import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/CategoryModel.dart';
import 'package:flutter_library_new/models/ReadingBooksModel.dart';
import 'package:flutter_library_new/models/SliderModel.dart';
import 'package:flutter_library_new/repository/book_repo.dart';
import 'package:flutter_library_new/repository/booksreading_repo.dart';
import 'package:flutter_library_new/repository/search_repo.dart';
import 'package:flutter_library_new/repository/slider_repo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'dart:convert';

class SliderController extends ControllerMVC{




  Future<List<SliderModel>> fetchSlider() async {
    try{
      final response = await fetchSliderR();
      print (response.statusCode);
      if (response.statusCode == 200) {

        var body =jsonDecode(response.body);
        List<SliderModel> slider =[];
        for ( var item in body)
        {
          slider.add(SliderModel.fromJson(item));
        }
        return slider;
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
