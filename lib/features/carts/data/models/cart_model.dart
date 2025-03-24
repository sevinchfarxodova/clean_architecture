import 'package:clean_architecture/features/carts/data/models/product_model.dart';
import 'package:clean_architecture/features/carts/domain/entities/cart._product.dart';

import '../../domain/entities/carts.dart';

class CartModel extends Cart {
  const CartModel({
    required super.id,
    required super.products,
    required super.total,
    required super.discountedTotal,
    required super.userId,
    required super.totalProducts,
    required super.totalQuantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json["id"],
    products: List<ProductCart>.from(
        json["products"].map((x) => CartProductModel.fromJson(x))),
    total: json["total"]?.toDouble(),
    discountedTotal: json["discountedTotal"]?.toDouble(),
    userId: json["userId"],
    totalProducts: json["totalProducts"],
    totalQuantity: json["totalQuantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "products": List<dynamic>.from(products.map((x) => (x as CartProductModel).toJson())),
    "total": total,
    "discountedTotal": discountedTotal,
    "userId": userId,
    "totalProducts": totalProducts,
    "totalQuantity": totalQuantity,
  };
}