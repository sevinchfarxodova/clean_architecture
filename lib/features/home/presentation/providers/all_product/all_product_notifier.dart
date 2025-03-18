import 'package:clean_architecture/features/home/domain/usecases/all_product_usecase.dart';
import 'package:clean_architecture/features/home/domain/usecases/search_product_usecase.dart';
import 'package:clean_architecture/features/home/domain/usecases/sort_all_product.dart';
import 'package:clean_architecture/features/home/presentation/providers/all_product/all_product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllProductNotifier extends StateNotifier<AllProductState> {
  final AllProductUseCase allProductUseCase;
  final SearchProductUseCase searchProductUseCase;
  final SortProductUseCase sortProductUseCase;

  AllProductNotifier(
    this.searchProductUseCase,
    this.allProductUseCase,
    this.sortProductUseCase,
  ) : super(AllProductInitial());

  Future<void> allProductInfo() async {
    try {
      state = AllProductLoading();
      final allProduct = await allProductUseCase();
      state = AllProductSuccess(allProduct);
    } catch (e) {
      state = AllProductError(e.toString());
    }
  }

  Future<void> searchProducts({required String query}) async {
    try {
      state = AllProductLoading();
      final searchProduct = await searchProductUseCase(query: query);
      state = AllProductSuccess(searchProduct);
    } catch (e) {
      state = AllProductError(e.toString());
    }
  }

  Future<void> sortAllProduct({
    required String sortName,
    required String acsDesc,
  }) async {
    try {
      state = AllProductLoading();
      final sortProduct = await sortProductUseCase(
        sortName: sortName,
        acsDesc: acsDesc,
      );
      state = AllProductSuccess(sortProduct);
    } catch (e) {
      state = AllProductError(e.toString());
    }
  }
}
