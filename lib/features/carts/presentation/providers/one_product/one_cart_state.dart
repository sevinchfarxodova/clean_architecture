import 'package:clean_architecture/features/carts/domain/entities/cart._product.dart';
import 'package:equatable/equatable.dart';

abstract class OneCartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OneCartInitial extends OneCartState {}

class OneCartLoading extends OneCartState {}

class OneCartSuccess extends OneCartState {
  final ProductCart productCart;

  OneCartSuccess(this.productCart);

  @override
  List<Object?> get props => [productCart];
}

class OneCartError extends OneCartState {
  final String message;

  OneCartError(this.message);

  @override
  List<Object?> get props => [message];
}
