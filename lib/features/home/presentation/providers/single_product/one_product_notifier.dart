import 'package:clean_architecture/features/home/domain/usecases/product_use_case.dart';
import 'package:clean_architecture/features/home/presentation/providers/single_product/one_product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/update_product.dart';

class OneProductNotifier extends StateNotifier<OneProductState> {
  final ProductUseCase productUseCase;
  final UpdateProductUseCase updateProductUseCase;


  OneProductNotifier(this.updateProductUseCase,  this.productUseCase) : super(OneProductInitial());

  Future<void> oneProduct(String id) async {
    try {
      state = OneProductLoading();
      final product = await productUseCase(id: id);
      state = OneProductSuccess(product);
    } catch (e) {
      state = OneProductError(e.toString());
    }
  }

  Future<void> updateProduct( int id,  String newTitle) async {
    try {
      state = OneProductLoading();
      final updateProducts = await updateProductUseCase(id: id, newTitle: newTitle);
      state = OneProductSuccess(updateProducts);
    } catch (e) {
      state = OneProductError(e.toString());
    }
  }
}
