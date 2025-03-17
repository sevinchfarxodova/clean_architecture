import 'package:clean_architecture/features/home/data/models/categories_models.dart';
import 'package:clean_architecture/features/home/domain/entities/all_product.dart';
import 'package:clean_architecture/features/home/domain/entities/categories.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/product.dart';
import '../../presentation/pages/all_products.dart';
import '../models/all_product_model.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> oneProductInfo({required String id});

  Future<AllProductModel> allProductInfo();

  Future<AllProductModel> searchProducts({required String query});

  Future<AllProductModel> sortAllProduct({
    required String sortName,
    required String acsDesc,
  });

  Future<List<CategoryModel>> getCategories();

  Future<AllProduct> getProductsByCategory({required String url});

  Future<Product> updateProduct({required int id, required String newTitle});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProductModel> oneProductInfo({required String id}) async {
    final response = await dio.get(
      'https://dummyjson.com/products/$id',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw Exception("Failed get one product info");
    }
  }

  @override
  Future<AllProductModel> allProductInfo() async {
    final response = await dio.get(
      'https://dummyjson.com/products',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (response.statusCode == 200) {
      return AllProductModel.fromJson(response.data);
    } else {
      throw Exception("Failed to get all product");
    }
  }

  @override
  Future<AllProductModel> searchProducts({required String query}) async {
    final response = await dio.get(
      'https://dummyjson.com/products/search?q=$query',
    );
    if (response.statusCode == 200) {
      return AllProductModel.fromJson(response.data);
    } else {
      throw Exception("Failed to get all product");
    }
  }

  @override
  Future<AllProductModel> sortAllProduct({
    required String sortName,
    required String acsDesc,
  }) async {
    final response = await dio.get(
      'https://dummyjson.com/products?sortBy=$sortName&order=$acsDesc',
    );
    if (response.statusCode == 200) {
      return AllProductModel.fromJson(response.data);
    } else {
      throw Exception("Failed to get sort product");
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await dio.get('https://dummyjson.com/products/categories');
    if (response.statusCode == 200) {
      return categoriesFromJson(response.data);
    } else {
      throw Exception("Failed to get categories product");
    }
  }

  @override
  Future<AllProductModel> getProductsByCategory({required String url}) async {
    final response = await dio.get(url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AllProductModel.fromJson(response.data);
    } else {
      throw Exception('Failed to  get Products ByCategory');
    }
  }

  @override
  Future<Product> updateProduct({
    required int id,
    required String newTitle,
  }) async {
    final response = await dio.put(
      'https://dummyjson.com/products/$id',
      options: Options(headers: {'Content-Type': 'application/json'}),
      data: {'title': newTitle},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ProductModel.fromJson(response.data);
    } else {
      throw Exception("Failed to get update product");
    }
  }
}
