import 'package:clean_architecture/features/home/data/data_sources/product_remote_data_source.dart';
import 'package:clean_architecture/features/home/domain/entities/all_product.dart';
import 'package:clean_architecture/features/home/domain/entities/categories.dart';
import 'package:clean_architecture/features/home/domain/entities/product.dart';
import 'package:clean_architecture/features/home/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Product> oneProductInfo({required String id}) {
    return remoteDataSource.oneProductInfo(id: id);
  }

  @override
  Future<AllProduct> allProductInfo() {
    return remoteDataSource.allProductInfo();
  }

  @override
  Future<AllProduct> searchProducts({required String query}) {
    return remoteDataSource.searchProducts(query: query);
  }


  @override
  Future<AllProduct> sortAllProducts({required String sortName, required String acsDesc}) {
  return remoteDataSource.sortAllProduct(sortName: sortName, acsDesc: acsDesc);
  }

  @override
  Future<List<Category>> getCategories() {
    return remoteDataSource.getCategories();
  }

  @override
  Future<AllProduct> getProductsByCategory({required String url}) {
    return remoteDataSource.getProductsByCategory(url: url);
  }

  @override
  Future<Product> updateProduct({required int id, required String newTitle}) {
return remoteDataSource.updateProduct(id: id, newTitle: newTitle);
  }
}
