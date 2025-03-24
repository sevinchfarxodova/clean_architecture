import 'package:clean_architecture/features/carts/domain/entities/cart._product.dart';
import 'package:clean_architecture/features/carts/domain/repositories/carts_repository.dart';

class DeleteCartUseCase{
  final CartRepository cartRepository;

  DeleteCartUseCase(this.cartRepository);

  Future<ProductCart> call({required String id}){
    return cartRepository.deleteCartData(id: id);
  }
}