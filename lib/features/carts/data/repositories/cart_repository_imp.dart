import 'package:clean_architecture/features/carts/data/data_sources/cart_remote_data_source.dart';
import 'package:clean_architecture/features/carts/domain/entities/all_cart.dart';
import 'package:clean_architecture/features/carts/domain/entities/cart._product.dart';
import 'package:clean_architecture/features/carts/domain/repositories/carts_repository.dart';

import '../models/cart_model.dart';

class CartRepositoryImpl implements CartRepository {
  final AllCartRemoteDataSource allCartRemoteDataSource;

  CartRepositoryImpl({required this.allCartRemoteDataSource});

  @override
  Future<AllCarts> allCartData() {
    return allCartRemoteDataSource.allCartData();
  }

  @override
  Future<ProductCart> oneCartData({required String id}) {
    return allCartRemoteDataSource.oneCartData(id: id);
  }

  @override
  Future<CartModel> addCart({
    required CartModel cartModel,
  }) {
    return allCartRemoteDataSource.addCart(cartModel: cartModel);
  }

  @override
  Future<ProductCart> deleteCartData({required String id}) {
    return allCartRemoteDataSource.deleteCart(id: id);
  }

  @override
  Future<ProductCart> updateCart({required int id, required int quantity}) {
   return updateCart(id: id, quantity: quantity);
  }
}
