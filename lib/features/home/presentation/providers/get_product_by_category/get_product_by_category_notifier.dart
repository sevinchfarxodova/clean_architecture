import 'package:clean_architecture/features/home/domain/usecases/get_products_by_category.dart';
import 'package:clean_architecture/features/home/presentation/providers/get_product_by_category/get_product_by_category_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ByCategoryNotifier extends StateNotifier<GetProductByCategoryState> {
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;

  ByCategoryNotifier(this.getProductsByCategoryUseCase)
      : super(GetProductByCategoryInitial());

  Future<void> getProductsByCategory({required String url}) async {
    state = GetProductByCategoryLoading();
    try {
      final  getProductCategories = await getProductsByCategoryUseCase(url: url);
      state = GetProductByCategorySuccess(getProductCategories);
    } catch (e) {
      state = GetProductByCategoryError(e.toString());
    }
  }
}
