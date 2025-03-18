import 'package:clean_architecture/features/home/domain/entities/all_product.dart';

abstract class GetProductByCategoryState {}

class GetProductByCategoryInitial extends GetProductByCategoryState {}

class GetProductByCategoryLoading extends GetProductByCategoryState {}

class GetProductByCategorySuccess extends GetProductByCategoryState {
  final AllProduct allProduct;

  GetProductByCategorySuccess(this.allProduct);
}

class GetProductByCategoryError extends GetProductByCategoryState {
  final String message;

  GetProductByCategoryError(this.message);
}
