import 'package:clean_architecture/features/home/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

abstract class DeleteProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteProductInitial extends DeleteProductState {}

class DeleteProductLoading extends DeleteProductState {}

class DeleteProductSuccess extends DeleteProductState {
  final Product product;

  DeleteProductSuccess(this.product);

  @override
  List<Object?> get props => [product];
}

class DeleteProductError extends DeleteProductState {
  final String message;

  DeleteProductError(this.message);

  @override
  List<Object?> get props => [message];
}
