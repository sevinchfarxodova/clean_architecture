import 'package:clean_architecture/features/carts/domain/entities/all_cart.dart';

abstract class AllCartState {}

class AllCartInitial extends AllCartState {}

class AllCartLoading extends AllCartState {}

class AllCartSuccess extends AllCartState {
  final AllCarts allCarts;

  AllCartSuccess(this.allCarts);
}

class AllCartError extends AllCartState {
  final String message;

  AllCartError(this.message);
}
