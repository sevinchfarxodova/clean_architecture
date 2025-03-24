import 'package:clean_architecture/features/carts/data/models/product_model.dart';
import 'package:clean_architecture/features/carts/domain/entities/all_cart.dart';
import 'package:clean_architecture/features/carts/domain/entities/cart._product.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/carts.dart';
import '../models/all_cart_model.dart';
import '../models/cart_model.dart';

abstract class AllCartRemoteDataSource {
  Future<AllCarts> allCartData();

  Future<ProductCart> oneCartData({required String id});

  Future<CartModel> addCart({required CartModel cartModel});

  Future<ProductCart> deleteCart({required String id});

  Future<Cart> updateCart({required int id, required int quantity});
}

class AllCartRemoteDataSourceImpl implements AllCartRemoteDataSource {
  final Dio dio;

  AllCartRemoteDataSourceImpl({required this.dio});

  @override
  Future<AllCarts> allCartData() async {
    final response = await dio.get(
      'https://dummyjson.com/carts',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return AllCartsModel.fromJson(response.data);
    } else {
      throw Exception("Failed to get all cards");
    }
  }

  @override
  Future<ProductCart> oneCartData({required String id}) async {
    final response = await dio.get('https://dummyjson.com/carts/$id');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return CartProductModel.fromJson(response.data);
    } else {
      throw Exception("Failed to get one product");
    }
  }

  @override
  Future<CartModel> addCart({required CartModel cartModel}) async {
    final response = await dio.post(
      'https://dummyjson.com/carts/add',
      data: cartModel.toJson(),
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return CartModel.fromJson(response.data);
    } else {
      throw Exception("Failed to get one product");
    }
  }

  @override
  Future<ProductCart> deleteCart({required String id}) async {
    final response = await dio.get(
      'https://dummyjson.com/carts/$id',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return CartProductModel.fromJson(response.data);
    } else {
      throw Exception("Failed to get one product");
    }
  }

  @override
  Future<Cart> updateCart({required int id, required int quantity}) async {
    final response = await dio.get(
      'https://dummyjson.com/carts/$id',
      data: {
        "merge": true,
        "products": [
          {"id": id, "quantity": quantity},
        ],
      },
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return CartModel.fromJson(response.data);
    } else {
      throw Exception("Failed to get update product");
    }
  }
}
