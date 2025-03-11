import 'package:clean_architecture/features/home/domain/entities/product.dart';
import 'package:clean_architecture/features/home/domain/repositories/product_repository.dart';

class ProductUseCase{
  final ProductRepository repository;

  ProductUseCase(this.repository);

  Future<Product>call({required String id}){
    return repository.oneProductInfo(id: id);
  }
}