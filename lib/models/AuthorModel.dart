
class AuthorModel{
  final String authorId;
  final String authorName;
  final String imageUrl;
  final String bio;

  AuthorModel({ this.authorId,this.authorName, this.imageUrl,this.bio});

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      authorId:json['authorId'],
      authorName:json['authrorName'],
      imageUrl:json['imageUrl'],
      bio:json['authorBio'],



    );
  }
}

