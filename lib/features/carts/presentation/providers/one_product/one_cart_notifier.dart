import 'package:clean_architecture/features/carts/domain/usecases/one_product_usecase.dart';
import 'package:clean_architecture/features/carts/presentation/providers/one_product/one_cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../domain/usecases/update_cart_usecase.dart';

class OneCartNotifier extends StateNotifier<OneCartState> {
  final OneCartUseCase oneCartUseCase;
  final UpdateCartUseCase updateCartUseCase;


  OneCartNotifier(this.oneCartUseCase, this.updateCartUseCase, )
    : super(OneCartInitial());
  var logger = Logger();

  Future<void> oneCartData(String id) async {
    try {
      state = OneCartLoading();
      final cart = await oneCartUseCase(id: id);
      state = OneCartSuccess(cart);
    } catch (e, s) {
      state = OneCartError(e.toString());
      logger.e(e);
      logger.d(s);
    }
  }

  Future<void> updateCart(int id, int quantity) async {
    try {
      state = OneCartLoading();
      final updateCart = await updateCartUseCase(id: id, quantity: quantity);
      state = OneCartSuccess(updateCart);
    } catch (e, s) {
      state = OneCartError(e.toString());
      logger.e(e);
      logger.d(s);
    }
  }
}
