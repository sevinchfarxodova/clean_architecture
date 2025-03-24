import 'package:clean_architecture/features/carts/data/models/cart_model.dart';
import 'package:clean_architecture/features/carts/domain/entities/all_cart.dart';
import '../entities/cart._product.dart';

abstract class CartRepository {
  Future<AllCarts> allCartData();

  Future<ProductCart> oneCartData({required String id});

  Future<CartModel> addCart({required CartModel cartModel});

  Future<ProductCart> deleteCartData({required String id});

  Future<ProductCart> updateCart({required int id, required int quantity});


}
