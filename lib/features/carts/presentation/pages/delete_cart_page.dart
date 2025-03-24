import 'package:clean_architecture/features/carts/presentation/providers/all_cart_provider.dart';
import 'package:clean_architecture/features/carts/presentation/providers/delete_cart/delete_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteCartPage extends ConsumerStatefulWidget {
  const DeleteCartPage({super.key});

  @override
  ConsumerState createState() => _DeleteCartPageState();
}

class _DeleteCartPageState extends ConsumerState<DeleteCartPage> {
  TextEditingController deleteController = TextEditingController();

  void deleteCart({required String id}) {
    ref.read(deleteCartNotifierProvider.notifier).deleteCart(id);
  }

  @override
  Widget build(BuildContext context) {
    final deleteCartState = ref.watch(deleteCartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Delete Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Product ID to delete",
                suffixIcon: ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.delete, color: Colors.redAccent, size: 26),
                ),
              ),
              controller: deleteController,
              keyboardType: TextInputType.number,
            ),
            if (deleteCartState is DeleteCartLoading)
              Center(child: CircularProgressIndicator()),
              if(deleteCartState is DeleteCartSuccess)
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            deleteCartState.productCart.thumbnail,
                            height: 200,
                            width: 200,
                          ),
                          Text(
                            deleteCartState.productCart.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Price: \$${deleteCartState.productCart.price.toString()}',
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
