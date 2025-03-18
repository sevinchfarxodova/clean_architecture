import 'package:clean_architecture/features/home/domain/entities/all_product.dart';
import 'package:clean_architecture/features/home/domain/repositories/product_repository.dart';

class GetProductsByCategoryUseCase{
  final ProductRepository productRepository;

  GetProductsByCategoryUseCase( this.productRepository);

  Future<AllProduct>call( {required String url}){
    return productRepository.getProductsByCategory(url: url);
  }
}