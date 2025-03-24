import 'package:clean_architecture/features/home/domain/entities/categories.dart';
import 'package:clean_architecture/features/home/domain/repositories/product_repository.dart';

class CategoriesProductUseCase{
  final ProductRepository repository;

  CategoriesProductUseCase(this.repository);

  Future<List<Category>>call(){
    return repository.getCategories();
  }
}