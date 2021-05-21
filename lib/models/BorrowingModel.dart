class BorrowingModel{
  String userId;
  String fullName;
  String endDate ;

  BorrowingModel({this.userId, this.fullName, this.endDate});

  factory BorrowingModel.fromJson(Map<String, dynamic> json)
  {
    return BorrowingModel(
        userId:json['userId'],
        fullName:json['fullName'],
      endDate :json['endDate'],

    );
  }
}