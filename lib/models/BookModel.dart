import 'package:flutter/cupertino.dart';

class BookModel {
  String bookId;
  String bookName;
  String bookPages;
  String categoryId;
  String authorId;
  String tag1,tag2,tag3;
  String summary;
  String imageUrl;


  BookModel({
      this.bookId,
      this.bookName,
      this.bookPages,
      this.categoryId,
      this.authorId,
      this.tag1,
      this.tag2,
      this.tag3,
      this.summary,
      this.imageUrl});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      bookId : json['bookId'],
      bookName: json['bookName'],
      bookPages: json['bookPages'],
      categoryId: json['categoryId'],
      authorId: json['authorId'],
      tag1: json['tag1'],
      tag2:json['tag2'],
      tag3:json['tag3'],
      summary:json['bookName'],
      imageUrl:json['imageUrl'],




    );
  }
}

List<BookModel> bookDemo = [
  BookModel(bookName: "السيرة الذاتية للمسيري"),
  BookModel(bookName: "1 السيرة الذاتية للمسيري"),
  BookModel(bookName: "السيرة الذاتية للمسيري"),
  BookModel(bookName: "السيرة الذاتية للمسيري"),
  BookModel(bookName: "السيرة الذاتية للمسيري"),
  BookModel(bookName: "السيرة الذاتية للمسيري"),
];
