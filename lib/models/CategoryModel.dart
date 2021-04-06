class CategoryModel {
  String categoryName;
  String categoryId;

  CategoryModel({this.categoryName, this.categoryId});


  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'],
      categoryName: json['categoryName']

    );
  }

}

List<CategoryModel> categoryDemo = [
  CategoryModel(categoryName: "دين "),
  CategoryModel(categoryName: "ثقافة "),
   CategoryModel(categoryName: "فكر "),
  CategoryModel(categoryName: "روايات "),
  CategoryModel(categoryName: "دين "),
  CategoryModel(categoryName: "ثقافة "),
  CategoryModel(categoryName: "فكر "),
  CategoryModel(categoryName: "روايات "),
  CategoryModel(categoryName: "روايات "),
  CategoryModel(categoryName: "روايات "),
  CategoryModel(categoryName: "روايات "),
  CategoryModel(categoryName: "روايات "),
  CategoryModel(categoryName: "دين "),
  CategoryModel(categoryName: "ثقافة "),


];
