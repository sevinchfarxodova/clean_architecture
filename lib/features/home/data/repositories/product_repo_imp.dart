import 'package:clean_architecture/features/home/data/data_sources/product_remote_data_source.dart';
import 'package:clean_architecture/features/home/domain/entities/product.dart';
import 'package:clean_architecture/features/home/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Product> oneProductInfo({required String id}) {
    return remoteDataSource.oneProductInfo(id: id);
  }
}
