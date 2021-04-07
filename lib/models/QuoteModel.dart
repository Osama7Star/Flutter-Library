class QuoteModel{
  String quoteId;
  String quote ;
  String likesNumber;
  String date;
  String userId;
  String fullName;
  String userName;
  String imageUrl;

  QuoteModel(
      {this.quoteId,
      this.quote,
      this.likesNumber,
      this.date,
      this.userId,
      this.fullName,
      this.userName,
      this.imageUrl});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
        quoteId : json['quoteId'],
        quote: json['quote'],
        likesNumber: json['likesNumber'],
        date: json['date'],
        userId: json['userId'],
        fullName: json['fullName'],
        userName: json['userName'],
        imageUrl: json['imageUrl'],

    );
  }


}