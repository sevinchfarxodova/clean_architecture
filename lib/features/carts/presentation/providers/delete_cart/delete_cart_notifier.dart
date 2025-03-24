import 'package:clean_architecture/features/carts/domain/usecases/delete_cart.dart';
import 'package:clean_architecture/features/carts/presentation/providers/delete_cart/delete_cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteCartNotifier extends StateNotifier<DeleteCartState> {
  final DeleteCartUseCase deleteCartUseCase;

  DeleteCartNotifier(this.deleteCartUseCase) : super(DeleteCartInitial());

  Future<void> deleteCart(String id) async {
    try {
      state = DeleteCartLoading();
      final deleteCart = await deleteCartUseCase(id: id);
      state = DeleteCartSuccess(deleteCart);
    } catch (e) {
      state = DeleteCartError(e.toString());
    }
  }
}
