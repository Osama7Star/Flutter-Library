import 'package:flutter/cupertino.dart';

class BookModel {
  String bookId;
  String ISBN;
  String bookName;
  String bookPages;
  String bookStatus;
  String categoryId;
  String authorId;
  String tag1,tag2,tag3;
  String summary;
  String imageUrl;
  String note ;

  String categoryName;
  String authorName;


  BookModel({
      this.bookId,
      this.ISBN,
      this.bookName,
      this.bookPages,
      this.categoryId,
      this.bookStatus,
      this.authorId,
      this.tag1,
      this.tag2,
      this.tag3,
      this.summary,
      this.imageUrl,
      this.categoryName,
      this.authorName,
      this.note

  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      bookId : json['bookId'],
      ISBN: json['ISBN'],
      bookName: json['bookName'],
      bookStatus : json['bookstatus'],
      bookPages: json['bookPages'],
      categoryId: json['categoryId'],
      authorId: json['authorId'],
      tag1: json['tag1'],
      tag2:json['tag2'],
      tag3:json['tag3'],
      summary:json['summary'],
      imageUrl:json['imageUrl'],

      categoryName: json['categoryName'],
      authorName: json['authrorName'],
      note :json['note']




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
