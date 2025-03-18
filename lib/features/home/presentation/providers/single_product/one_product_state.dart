import 'package:clean_architecture/features/home/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

abstract class OneProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OneProductInitial extends OneProductState {}

class OneProductLoading extends OneProductState {}

class OneProductSuccess extends OneProductState {
  final Product product;

  OneProductSuccess(this.product);

  @override
  List<Object?> get props => [product];
}

class OneProductError extends OneProductState {
  final String message;

  OneProductError(this.message);

  @override
  List<Object?> get props => [message];
}
