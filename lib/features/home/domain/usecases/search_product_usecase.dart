import 'package:clean_architecture/features/home/domain/entities/all_product.dart';
import 'package:clean_architecture/features/home/domain/repositories/product_repository.dart';

class SearchProductUseCase{
  final ProductRepository productRepository;

  SearchProductUseCase( this.productRepository);

  Future<AllProduct>call( {required String query}){
    return productRepository.searchProducts(query: query);
  }
}