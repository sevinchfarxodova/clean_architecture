import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class AddProductUsecase {
  final ProductRepository repository;

  AddProductUsecase(this.repository);

  Future<ProductModel> call({required  ProductModel productModel}) {
    return repository.addProduct(productModel: productModel);
  }
}