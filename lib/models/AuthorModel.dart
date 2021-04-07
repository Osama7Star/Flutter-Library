
class AuthorModel{
  final String authorId;
  final String authorName;
  final String imageUrl;

  AuthorModel({ this.authorId,this.authorName, this.imageUrl});

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      authorId:json['authorId'],
      authorName:json['authrorName'],
      imageUrl:json['imageUrl'],




    );
  }
}

