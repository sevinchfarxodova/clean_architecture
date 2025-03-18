import 'package:clean_architecture/features/home/domain/entities/product.dart';
import 'package:clean_architecture/features/home/domain/repositories/product_repository.dart';

class UpdateProductUseCase{
  final ProductRepository repository;

  UpdateProductUseCase(this.repository);

  Future<Product>call({required int id, required String newTitle}){
    return repository.updateProduct(id: id, newTitle: newTitle);
  }
}