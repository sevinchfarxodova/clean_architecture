import 'package:clean_architecture/features/carts/domain/repositories/carts_repository.dart';

import '../entities/cart._product.dart';

class OneCartUseCase {
  final CartRepository cartRepository;

  OneCartUseCase(this.cartRepository);

    Future<ProductCart> call({required String id}) {
    return cartRepository.oneCartData(id: id);
  }
}