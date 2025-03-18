import 'package:clean_architecture/features/home/domain/usecases/categorie_usecase.dart';
import 'package:clean_architecture/features/home/presentation/providers/categories_product/categories_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesNotifier extends StateNotifier<CategoriesState> {
  final CategoriesProductUseCase categoriesProductUseCase;

  CategoriesNotifier(this.categoriesProductUseCase)
    : super(CategoriesInitial());

  Future<void> getCategories() async {
    state = CategoriesLoading();
    try {
      final  categoriesProduct = await categoriesProductUseCase();
      state = CategoriesSuccess(categoriesProduct);
    } catch (e) {
      state = CategoriesError(e.toString());
    }
  }
}
