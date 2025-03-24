import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/product_model.dart';
import '../../../domain/usecases/add_product_use_case.dart';
import 'add_product_state.dart';

class AddProductNotifier extends StateNotifier<AddProductState> {
  final AddProductUsecase addProductUseCase;

  AddProductNotifier(this.addProductUseCase) : super(AddProductInitial());

  Future<void> addProduct( ProductModel productModel) async {
    state = AddProductLoading();
    try {
      final product = await addProductUseCase(productModel: productModel);
      state = AddProductLoaded(product);
    } catch (e) {
      state = AddProductError(e.toString());
    }
  }
}