import 'package:clean_architecture/features/home/domain/entities/categories.dart';

import '../entities/all_product.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Product> oneProductInfo({required String id});

  Future<AllProduct> allProductInfo();

  Future<AllProduct> searchProducts({required String query});

  Future<AllProduct> sortAllProducts({
    required String sortName,
    required String acsDesc,
  });

  Future <List<Category>> getCategories();

  Future<AllProduct> getProductsByCategory({required String url});

  Future<Product> updateProduct({required int id, required String newTitle});


}
