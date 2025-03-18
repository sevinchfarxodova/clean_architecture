import 'package:clean_architecture/features/home/domain/entities/all_product.dart';
import 'package:clean_architecture/features/home/domain/repositories/product_repository.dart';

class AllProductUseCase{
  final ProductRepository repository;

  AllProductUseCase(this.repository);

  Future<AllProduct>call(){
    return repository.allProductInfo();
  }
}