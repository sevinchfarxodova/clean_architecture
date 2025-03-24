
import 'package:clean_architecture/features/home/domain/entities/categories.dart';

List<CategoryModel> categoriesFromJson(List str) =>
    List<CategoryModel>.from(str.map((x) => CategoryModel.fromJson(x)));

class CategoryModel extends Category {
  CategoryModel({required super.slug, required super.name, required super.url});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    slug: json["slug"] ?? "",
    name: json["name"] ?? "",
    url: json["url"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "slug": slug  ,
    "name": name ,
    "url": url ,
  };
}
