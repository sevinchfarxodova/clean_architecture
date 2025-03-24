import 'package:clean_architecture/features/carts/domain/entities/all_cart.dart';
import 'package:clean_architecture/features/carts/domain/repositories/carts_repository.dart';

class AllCartUseCase{
  final CartRepository cartRepository;

  AllCartUseCase(this.cartRepository);

  Future<AllCarts>call(){
    return cartRepository.allCartData();
  }
}