import 'package:clean_architecture/features/carts/data/data_sources/cart_remote_data_source.dart';
import 'package:clean_architecture/features/carts/data/repositories/cart_repository_imp.dart';
import 'package:clean_architecture/features/carts/domain/repositories/carts_repository.dart';
import 'package:clean_architecture/features/carts/domain/usecases/add_cart.dart';
import 'package:clean_architecture/features/carts/domain/usecases/all_cart_usecase.dart';
import 'package:clean_architecture/features/carts/domain/usecases/delete_cart.dart';
import 'package:clean_architecture/features/carts/domain/usecases/one_product_usecase.dart';
import 'package:clean_architecture/features/carts/domain/usecases/update_cart_usecase.dart';
import 'package:clean_architecture/features/carts/presentation/providers/add_cart/add_cart_notifier.dart';
import 'package:clean_architecture/features/carts/presentation/providers/add_cart/add_cart_state.dart';
import 'package:clean_architecture/features/carts/presentation/providers/all_cart/all_cart_notifier.dart';
import 'package:clean_architecture/features/carts/presentation/providers/all_cart/all_cart_state.dart';
import 'package:clean_architecture/features/carts/presentation/providers/delete_cart/delete_cart_notifier.dart';
import 'package:clean_architecture/features/carts/presentation/providers/delete_cart/delete_cart_state.dart';
import 'package:clean_architecture/features/carts/presentation/providers/one_product/one_cart_notifier.dart';
import 'package:clean_architecture/features/carts/presentation/providers/one_product/one_cart_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) => Dio());

// remote
final allCartRemoteDataSourceProvider = Provider<AllCartRemoteDataSource>((
  ref,
) {
  return AllCartRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

// repository
final allCartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepositoryImpl(
    allCartRemoteDataSource: ref.watch(allCartRemoteDataSourceProvider),
  );
});

// useCase
final allCartUseCaseProvider = Provider<AllCartUseCase>((ref) {
  return AllCartUseCase(ref.watch(allCartRepositoryProvider));
});

final oneCartUseCaseProvider = Provider<OneCartUseCase>((ref) {
  return OneCartUseCase(ref.watch(allCartRepositoryProvider));
});

final addCartUseCaseProvider = Provider<AddCartUseCase>((ref) {
  return AddCartUseCase(ref.watch(allCartRepositoryProvider));
});

final deleteCartUseCaseProvider = Provider((ref) {
  return DeleteCartUseCase(ref.watch(allCartRepositoryProvider));
});

final updateCartUseCaseProvider = Provider<UpdateCartUseCase>((ref) {
  return UpdateCartUseCase(
    cartRepository: ref.watch(allCartRepositoryProvider),
  );
});

// Notifier
final allCartNotifierProvider =
    StateNotifierProvider<AllCartNotifier, AllCartState>((ref) {
      return AllCartNotifier(ref.watch(allCartUseCaseProvider));
    });

final oneCartNotifierProvider =
    StateNotifierProvider<OneCartNotifier, OneCartState>((ref) {
      return OneCartNotifier(
        ref.watch(oneCartUseCaseProvider),
          ref.watch(updateCartUseCaseProvider),
      );
    });

final addCartNotifierProvider =
    StateNotifierProvider<AddCartNotifier, AddCartState>((ref) {
      return AddCartNotifier(ref.watch(addCartUseCaseProvider));
    });

final deleteCartNotifierProvider =
    StateNotifierProvider<DeleteCartNotifier, DeleteCartState>((ref) {
      return DeleteCartNotifier(ref.watch(deleteCartUseCaseProvider));
    });
