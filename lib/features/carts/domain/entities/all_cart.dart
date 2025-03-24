import 'carts.dart';

class AllCarts  {
  final List<Cart> carts;
  final int total;
  final int skip;
  final int limit;

  const AllCarts({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

}