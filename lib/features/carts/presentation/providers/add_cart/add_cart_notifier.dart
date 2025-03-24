import 'package:clean_architecture/features/carts/domain/usecases/add_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/cart_model.dart';
import 'add_cart_state.dart';
import 'package:logger/logger.dart';


class AddCartNotifier extends StateNotifier<AddCartState>{
  final AddCartUseCase addCartUseCase;
  var logger = Logger();
  AddCartNotifier(this.addCartUseCase) : super(AddCartInitial());

  Future<void> addCart(CartModel cartModel) async {
    state = AddCartLoading();
    try {
      final cart = await addCartUseCase(cartModel: cartModel);
      state = AddCartSuccess(cart);
    }catch(e, s){
      state= AddCartError(e.toString());
      logger.e(e);
      logger.d(s);
    }
  }
}