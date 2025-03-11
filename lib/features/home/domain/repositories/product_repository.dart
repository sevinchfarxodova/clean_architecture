import '../entities/product.dart';

abstract class ProductRepository{
  Future<Product> oneProductInfo({required String id});
}