class BorrowingModel{
  String userId;
  String fullName;
  String date ;

  BorrowingModel({this.userId, this.fullName, this.date});

  factory BorrowingModel.fromJson(Map<String, dynamic> json)
  {
    return BorrowingModel(
        userId:json['userId'],
        fullName:json['fullName'],
        date :json['endDate'],

    );
  }
}