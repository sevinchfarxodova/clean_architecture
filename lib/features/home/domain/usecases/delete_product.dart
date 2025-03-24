import 'package:clean_architecture/features/home/domain/entities/product.dart';
import 'package:clean_architecture/features/home/domain/repositories/product_repository.dart';

class DeleteProductUseCase{
  final ProductRepository repository;

  DeleteProductUseCase(this.repository);

  Future<Product>call({required String id}){
    return repository.deleteProductInfo(id: id);
  }
}