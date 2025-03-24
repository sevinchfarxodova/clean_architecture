import 'package:clean_architecture/features/carts/domain/usecases/all_cart_usecase.dart';
import 'package:clean_architecture/features/carts/presentation/providers/all_cart/all_cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllCartNotifier extends StateNotifier<AllCartState> {
  final AllCartUseCase allCartUseCase;

  AllCartNotifier(this.allCartUseCase) : super(AllCartInitial());

  Future<void> allCartData() async {
    try {
      state = AllCartLoading();
      final allCart = await allCartUseCase();
      state = AllCartSuccess(allCart);
    } catch (e) {
      state = AllCartError(e.toString());
    }
  }
}
