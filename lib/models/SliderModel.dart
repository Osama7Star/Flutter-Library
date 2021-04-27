class SliderModel{
  String imageUrl;
  String sliderId;

  SliderModel({this.imageUrl, this.sliderId});
  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
        imageUrl :json['imageUrl'],
        sliderId:json['slideId']

    );
  }
}