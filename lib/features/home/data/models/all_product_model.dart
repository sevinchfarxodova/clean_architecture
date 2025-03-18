import 'product_model.dart';
import '../../domain/entities/all_product.dart';

class AllProductModel extends AllProduct {
  AllProductModel(
      {required super.products,
        required super.total,
        required super.skip,
        required super.limit});

  factory AllProductModel.fromJson(Map<String, dynamic> json) {
    return AllProductModel(
      products:
      (json['products']as List).map((e) => ProductModel.fromJson(e)).toList() ,
      total: json['total'] ?? 0,
      skip: json['skip'] ?? 0,
      limit: json['limit'] ?? 0,
    );
  }
}