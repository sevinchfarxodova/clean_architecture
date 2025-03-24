import 'package:clean_architecture/features/carts/data/models/product_model.dart';
import 'package:clean_architecture/features/carts/domain/repositories/carts_repository.dart';

import '../../data/models/cart_model.dart';

class AddCartUseCase {
  final CartRepository cartRepository;

  AddCartUseCase(this.cartRepository);

  Future<CartModel> call({required CartModel cartModel}) {
    return cartRepository.addCart(cartModel: cartModel);
  }
}
