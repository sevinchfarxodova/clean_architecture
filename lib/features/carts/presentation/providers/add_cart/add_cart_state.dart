import 'package:clean_architecture/features/carts/data/models/cart_model.dart';

import '../../../data/models/product_model.dart';

abstract class AddCartState {}

class AddCartInitial extends AddCartState {}

class AddCartLoading extends AddCartState {}

class AddCartSuccess extends AddCartState {
  final CartModel cartModel;
  AddCartSuccess(this.cartModel);
}

class AddCartError extends AddCartState {
  final String message;
  AddCartError(this.message);
}