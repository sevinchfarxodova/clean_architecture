import 'package:clean_architecture/features/carts/domain/entities/cart._product.dart';
import 'package:clean_architecture/features/carts/domain/entities/carts.dart';
import 'package:clean_architecture/features/carts/domain/repositories/carts_repository.dart';

class UpdateCartUseCase{
  final CartRepository cartRepository;

  UpdateCartUseCase({ required this.cartRepository});

  Future<ProductCart> call({required int id, required int quantity}){
    return cartRepository.updateCart(id: id, quantity: quantity);

  }
}