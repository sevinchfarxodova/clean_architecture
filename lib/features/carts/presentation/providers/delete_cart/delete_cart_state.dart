import 'package:clean_architecture/features/carts/domain/entities/cart._product.dart';
import 'package:equatable/equatable.dart';

abstract class DeleteCartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteCartInitial extends DeleteCartState {}

class DeleteCartLoading extends DeleteCartState {}

class DeleteCartSuccess extends DeleteCartState {
  final ProductCart productCart;

  DeleteCartSuccess(this.productCart);

  @override
  List<Object?> get props => [productCart];
}

class DeleteCartError extends DeleteCartState {
  final String message;

  DeleteCartError(this.message);

  @override
  List<Object?> get props => [message];
}
