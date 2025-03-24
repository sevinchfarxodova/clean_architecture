import 'package:clean_architecture/features/home/domain/entities/all_product.dart';

abstract class AllProductState {}

class AllProductInitial extends AllProductState {}

class AllProductLoading extends AllProductState {}

class AllProductSuccess extends AllProductState {
  AllProduct allProduct;

  AllProductSuccess(this.allProduct);
}

class AllProductError extends AllProductState {
  final String message;

  AllProductError(this.message);
}
