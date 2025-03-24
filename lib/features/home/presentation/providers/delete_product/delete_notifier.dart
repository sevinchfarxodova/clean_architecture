import 'package:clean_architecture/features/home/domain/usecases/delete_product.dart';
import 'package:clean_architecture/features/home/presentation/providers/delete_product/delete_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteProductNotifier extends StateNotifier<DeleteProductState> {
  final DeleteProductUseCase deleteProductUseCase;


  DeleteProductNotifier(  this.deleteProductUseCase) : super(DeleteProductLoading());

  Future<void> deleteProductInfo( int id) async {
    try {
      state = DeleteProductLoading();
      final deleteProducts = await deleteProductUseCase(id: id.toString());
      state = DeleteProductSuccess(deleteProducts);
    } catch (e) {
      state = DeleteProductError(e.toString());
    }
  }
}
