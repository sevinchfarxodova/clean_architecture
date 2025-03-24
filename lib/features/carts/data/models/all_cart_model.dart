import 'package:clean_architecture/features/carts/data/models/cart_model.dart';
import 'package:clean_architecture/features/carts/domain/entities/carts.dart';

import '../../domain/entities/all_cart.dart';

class AllCartsModel extends AllCarts  {
   AllCartsModel({
    required super.carts,
    required super.total,
    required super.skip,
    required super.limit,
  });

  factory AllCartsModel.fromJson(Map<String, dynamic> json) => AllCartsModel(
    carts: List<Cart>.from(
        (json["carts"]??[]).map((x) => CartModel.fromJson(x))),
    total: json["total"] ?? 0,
    skip: json["skip"]?? 0,
    limit: json["limit"]?? 0,
  );

  Map<String, dynamic> toJson() => {
    "carts": List<dynamic>.from(carts.map((x) => (x as CartModel).toJson())),
    "total": total ,
    "skip": skip ,
    "limit": limit,
  };
}




