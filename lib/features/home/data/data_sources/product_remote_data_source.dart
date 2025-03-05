import 'package:dio/dio.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> oneProductInfo({required int id});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProductModel> oneProductInfo({required int id}) async {
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
}
