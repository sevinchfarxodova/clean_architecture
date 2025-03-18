import 'package:clean_architecture/features/home/domain/entities/all_product.dart';
import 'package:clean_architecture/features/home/domain/repositories/product_repository.dart';

class SortProductUseCase{
  final ProductRepository productRepository;

  SortProductUseCase( this.productRepository);

  Future<AllProduct>call( {required String sortName, required String  acsDesc}){
    return productRepository.sortAllProducts(sortName: sortName, acsDesc: acsDesc);
  }
}