class BookReviewsModel {
  String reviewId;
  String userName;
  String fullName;
  String review;
  String rate;

  String imageUrl;
  String date;

  String userId;

  BookReviewsModel({this.reviewId,
    this.userName,
    this.fullName,
    this.review,
    this.rate,
    this.imageUrl,
    this.date,
    this.userId});

  factory BookReviewsModel.fromJson(Map<String, dynamic> json)
  {
    return BookReviewsModel(
        reviewId: json['reviewId'],
        userName: json['userName'],
        fullName: json['fullName'],
        review: json['review'],
        rate: json['rate'],
        imageUrl: json['imageUrl'],
        date: json['date'],
        userId: json['userId'],

    );
  }
}
