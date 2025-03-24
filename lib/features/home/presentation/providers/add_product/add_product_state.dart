import '../../../data/models/product_model.dart';

abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductLoaded extends AddProductState {
  final ProductModel productModel;
  AddProductLoaded(this.productModel);
}

class AddProductError extends AddProductState {
  final String message;
  AddProductError(this.message);
}