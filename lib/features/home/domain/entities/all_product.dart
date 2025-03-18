import 'product.dart';

class AllProduct {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  AllProduct({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });
}

