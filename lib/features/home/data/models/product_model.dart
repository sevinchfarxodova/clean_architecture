import 'package:json_annotation/json_annotation.dart';
import 'package:clean_architecture/features/home/domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  ProductModel({
    required int id,
    required String title,
    required String description,
    required String category,
    required double price,
    required double discountPercentage,
    required double rating,
    required int stock,
    required List<String> tags,
    required String sku,
    required double weight,
    required String warrantyInformation,
    required String shippingInformation,
    required String availabilityStatus,
    required String returnPolicy,
    required int minimumOrderQuantity,
    required String thumbnail,
    required List<String> images,
  }) : super(
    id: id,
    title: title,
    description: description,
    category: category,
    price: price,
    discountPercentage: discountPercentage,
    rating: rating,
    stock: stock,
    tags: tags,
    sku: sku,
    weight: weight,
    warrantyInformation: warrantyInformation,
    shippingInformation: shippingInformation,
    availabilityStatus: availabilityStatus,
    returnPolicy: returnPolicy,
    minimumOrderQuantity: minimumOrderQuantity,
    thumbnail: thumbnail,
    images: images,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(
        id: (json['id'] as num).toInt(),
        title: json['title'] as String,
        description: json['description'] as String,
        category: json['category'] as String,
        price: (json['price'] as num).toDouble(),
        discountPercentage: (json['discountPercentage'] as num).toDouble(),
        rating: (json['rating'] as num).toDouble(),
        stock: (json['stock'] as num).toInt(),
        tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
        sku: json['sku'] as String,
        weight: (json['weight'] as num).toDouble(),
        warrantyInformation: json['warrantyInformation'] as String,
        shippingInformation: json['shippingInformation'] as String,
        availabilityStatus: json['availabilityStatus'] as String,
        returnPolicy: json['returnPolicy'] as String,
        minimumOrderQuantity: (json['minimumOrderQuantity'] as num).toInt(),
        thumbnail: json['thumbnail'] as String,
        images: (json['images'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() {
   return { 'id': id,
    'title': title,
    'description': description,
    'category': category,
    'price': price,
    'discountPercentage': discountPercentage,
    'rating': rating,
    'stock': stock,
    'tags': tags,
    'sku': sku,
    'weight': weight,
    'warrantyInformation': warrantyInformation,
    'shippingInformation': shippingInformation,
    'availabilityStatus': availabilityStatus,
    'returnPolicy': returnPolicy,
    'minimumOrderQuantity': minimumOrderQuantity,
    'thumbnail': thumbnail,
    'images': images,
  };
}
}
