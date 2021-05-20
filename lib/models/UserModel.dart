class UserModel{
  String userId;
  String fullName;
  String password;
  String userName ;
  String imageUrl ;
  String universityName ;
  String collageName ;
  String bio   ;
  String endDate   ;

  UserModel({this.userId, this.fullName,this.password, this.userName, this.imageUrl,
    this.universityName, this.collageName, this.bio, this.endDate});

  factory UserModel.fromJson(Map<String, dynamic> json)
  {
    return UserModel(
        userId : json['userId'],
        password : json['password'],
        fullName: json['fullName'],
        userName: json['userName'],
        imageUrl: json['imageUrl'],
        universityName: json['universityName'],
        collageName: json['collageName'],
        bio: json['bio'],

    );
  }
}

