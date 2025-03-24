import 'package:clean_architecture/features/carts/domain/entities/cart._product.dart';

class Cart  {
  final int id;
  final List<ProductCart> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  const Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

}


