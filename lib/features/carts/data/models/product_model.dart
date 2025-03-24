import '../../domain/entities/cart._product.dart';

class CartProductModel extends ProductCart {
   CartProductModel({
     super.id,
    required super.title,
    required super.price,
    required super.quantity,
    required super.total,
    required super.discountPercentage,
    required super.discountedTotal,
    required super.thumbnail,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) => CartProductModel(
    id: json["id"] ?? 0,
    title: json["title"]?? "",
    price: json["price"]?.toDouble() ?? 0,
    quantity: json["quantity"] ?? 0,
    total: json["total"]?.toDouble()?? 0,
    discountPercentage: json["discountPercentage"]?.toDouble()?? 0,
    discountedTotal: json["discountedTotal"]?.toDouble()?? 0,
    thumbnail: json["thumbnail"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "quantity": quantity,
    "total": total,
    "discountPercentage": discountPercentage,
    "discountedTotal": discountedTotal,
    "thumbnail": thumbnail,
  };
}
