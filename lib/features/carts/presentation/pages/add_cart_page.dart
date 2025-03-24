import 'package:clean_architecture/features/carts/data/models/cart_model.dart';
import 'package:clean_architecture/features/carts/data/models/product_model.dart';
import 'package:clean_architecture/features/carts/presentation/providers/add_cart/add_cart_state.dart';
import 'package:clean_architecture/features/carts/presentation/providers/all_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCartPage extends ConsumerStatefulWidget {
  const AddCartPage({super.key});

  @override
  ConsumerState createState() => _AddCartPageState();
}

class _AddCartPageState extends ConsumerState<AddCartPage> {
  TextEditingController userIdController = TextEditingController();

  void addCart() {
    CartProductModel cartProductModel = CartProductModel(
      id: 1,
      title: "title",
      price: 10.0,
      quantity: 2,
      total: 1.1,
      discountPercentage: 1.1,
      discountedTotal: 1.1,
      thumbnail: "",
    );
    CartModel cartModel = CartModel(
      id: 1,
      products: [cartProductModel,cartProductModel,cartProductModel],
      total: 6.0,
      discountedTotal: 1.0,
      userId: 2,
      totalProducts: 2,
      totalQuantity: 3,
    );
    ref.read(addCartNotifierProvider.notifier).addCart(cartModel);
  }

  @override
  Widget build(BuildContext context) {
    final addCartState = ref.watch(addCartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Add Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: userIdController,
              decoration: InputDecoration(labelText: "User id"),
            ),
            ElevatedButton(
              onPressed: () {
                addCart();
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            if (addCartState is AddCartLoading)
              Center(child: CircularProgressIndicator()),
            if (addCartState is AddCartError) Text(addCartState.message),
            if (addCartState is AddCartSuccess)
              Text(
                addCartState.cartModel.totalQuantity.toString(),
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
