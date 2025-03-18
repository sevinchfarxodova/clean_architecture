import 'package:clean_architecture/features/home/data/data_sources/product_remote_data_source.dart';
import 'package:clean_architecture/features/home/data/repositories/product_repo_imp.dart';
import 'package:clean_architecture/features/home/domain/repositories/product_repository.dart';
import 'package:clean_architecture/features/home/domain/usecases/add_product_use_case.dart';
import 'package:clean_architecture/features/home/domain/usecases/categorie_usecase.dart';
import 'package:clean_architecture/features/home/domain/usecases/delete_product.dart';
import 'package:clean_architecture/features/home/domain/usecases/get_products_by_category.dart';
import 'package:clean_architecture/features/home/domain/usecases/product_use_case.dart';
import 'package:clean_architecture/features/home/domain/usecases/sort_all_product.dart';
import 'package:clean_architecture/features/home/domain/usecases/update_product.dart';
import 'package:clean_architecture/features/home/presentation/providers/add_product/add_product_notifier.dart';
import 'package:clean_architecture/features/home/presentation/providers/add_product/add_product_state.dart';
import 'package:clean_architecture/features/home/presentation/providers/categories_product/categories_notifier.dart';
import 'package:clean_architecture/features/home/presentation/providers/categories_product/categories_state.dart';
import 'package:clean_architecture/features/home/presentation/providers/delete_product/delete_notifier.dart';
import 'package:clean_architecture/features/home/presentation/providers/delete_product/delete_state.dart';
import 'package:clean_architecture/features/home/presentation/providers/get_product_by_category/get_product_by_category_notifier.dart';
import 'package:clean_architecture/features/home/presentation/providers/get_product_by_category/get_product_by_category_state.dart';
import 'package:clean_architecture/features/home/presentation/providers/single_product/one_product_notifier.dart';
import 'package:clean_architecture/features/home/presentation/providers/single_product/one_product_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/all_product_usecase.dart';
import '../../domain/usecases/search_product_usecase.dart';
import 'all_product/all_product_notifier.dart';
import 'all_product/all_product_state.dart';

final dioProvider = Provider((ref) => Dio());

// remote
final oneProductRemoteDataSourceProvider = Provider<ProductRemoteDataSource>((
    ref,) {
  return ProductRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

// repository
final oneProductRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(
    ref.watch(oneProductRemoteDataSourceProvider),
  );
});

// useCase
final oneProductUseCaseProvider = Provider<ProductUseCase>((ref) {
  return ProductUseCase(ref.watch(oneProductRepositoryProvider));
});

final updateProductUseCaseProvider = Provider<UpdateProductUseCase>((ref) {
  return UpdateProductUseCase(ref.watch(oneProductRepositoryProvider));
});

final allProductUseCaseProvider = Provider<AllProductUseCase>((ref) {
  return AllProductUseCase(ref.watch(oneProductRepositoryProvider));
});

final searchProductUseCaseProvider = Provider<SearchProductUseCase>((ref) {
  return SearchProductUseCase(ref.watch(oneProductRepositoryProvider));
});

final sortProductUseCaseProvider = Provider<SortProductUseCase>((ref) {
  return SortProductUseCase(ref.watch(oneProductRepositoryProvider));
});

final categoriesProductUseCaseProvider = Provider<CategoriesProductUseCase>((
    ref,) {
  return CategoriesProductUseCase(ref.watch(oneProductRepositoryProvider));
});

final getProductByCategoriesUseCaseProvider = Provider<
    GetProductsByCategoryUseCase>((ref) {
  return GetProductsByCategoryUseCase(ref.watch(oneProductRepositoryProvider));
});

final addProductUseCaseProvider = Provider<AddProductUsecase>((ref) {
  return AddProductUsecase(ref.watch(oneProductRepositoryProvider));
});

final deleteProductUseCaseProvider = Provider((ref){
  return  DeleteProductUseCase(ref.watch(oneProductRepositoryProvider));
});

// Notifier
final oneProductNotifierProvider =
StateNotifierProvider<OneProductNotifier, OneProductState>((ref) {
  return OneProductNotifier(
      ref.watch(updateProductUseCaseProvider),
      ref.watch(oneProductUseCaseProvider)
  );
});

final allProductNotifierProvider =
StateNotifierProvider<AllProductNotifier, AllProductState>((ref) {
  return AllProductNotifier(
    ref.watch(searchProductUseCaseProvider),
    ref.watch(allProductUseCaseProvider),
    ref.watch(sortProductUseCaseProvider),
  );
});

final categoriesProductNotifierProvider =
StateNotifierProvider<CategoriesNotifier, CategoriesState>((ref) {
  return CategoriesNotifier(ref.watch(categoriesProductUseCaseProvider));
});

final getProductByCategoryProvider = StateNotifierProvider<
    ByCategoryNotifier,
    GetProductByCategoryState>((ref) {
  return ByCategoryNotifier(ref.watch(getProductByCategoriesUseCaseProvider));
});

final addProductProvider = StateNotifierProvider<
    AddProductNotifier,
    AddProductState>((ref) {
  return AddProductNotifier(ref.watch(addProductUseCaseProvider));
});

final deleteProductProvider = StateNotifierProvider<DeleteProductNotifier, DeleteProductState>((ref){
  return DeleteProductNotifier(ref.watch(deleteProductUseCaseProvider));

});
