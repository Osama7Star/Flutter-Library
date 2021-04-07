class ReadingBooksModel {

  String borrowingRecordId;

  String bookId;

  String userId;

  String bookName;

  String userName;

  String fullName;

  String startDate;

  String imageUrl;

  ReadingBooksModel({this.borrowingRecordId,
    this.bookId,
    this.userId,
    this.bookName,
    this.userName,
    this.fullName,
    this.startDate,
    this.imageUrl});

  factory ReadingBooksModel.fromJson(Map<String, dynamic> json) {
    return ReadingBooksModel(
      borrowingRecordId: json['borrowingRecordId'],
      bookId: json['bookId'],
      userId: json['userId'],
      bookName: json['bookName'],
      userName: json['userName'],
      fullName: json['fullName'],
      startDate: json['startDate'],
      imageUrl: json['imageUrl'],
    );
  }
}