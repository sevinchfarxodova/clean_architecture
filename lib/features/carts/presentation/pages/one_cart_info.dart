import 'package:clean_architecture/features/carts/domain/entities/cart._product.dart';
import 'package:clean_architecture/features/carts/presentation/providers/all_cart_provider.dart';
import 'package:clean_architecture/features/carts/presentation/providers/one_product/one_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OneCartInfo extends ConsumerStatefulWidget {
  final List<ProductCart> products;
  final String cartId;

   OneCartInfo({super.key, required this.cartId, required this.products});

  @override
  ConsumerState createState() => _OneCartInfoState();
}

class _OneCartInfoState extends ConsumerState<OneCartInfo> {
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(oneCartNotifierProvider.notifier).oneCartData(widget.cartId);
    });
  }

  void getOneCart({required String id}) {
    ref.read(oneCartNotifierProvider.notifier).oneCartData(id);
  }

  void updateCart({required int id, required int quantity}) {
    ref.read(oneCartNotifierProvider.notifier).updateCart(id, quantity);

  }


  @override
  Widget build(BuildContext context) {
    final oneCartState = ref.watch(oneCartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          "One Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: "Enter id"),
            ),
            IconButton(
              onPressed: () {
                getOneCart(id: idController.text.trim());
              },
              icon: Icon(Icons.get_app),
            ),
            SizedBox(height: 16),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(
                labelText: "Update quantity..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ),
          IconButton(
            onPressed: () {
              if (oneCartState is OneCartSuccess) {
                if (quantityController.text.trim().isNotEmpty) {
                  final quantity = int.tryParse(quantityController.text.trim());
                  if (quantity != null && quantity > 0) {
                    updateCart(id: oneCartState.productCart.id!, quantity: quantity);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Enter a valid quantity!")),
                    );
                  }
                }
              }
            },
            icon: Icon(Icons.update, color: Colors.purpleAccent, size: 28),
          ),

            if (oneCartState is OneCartLoading) CircularProgressIndicator(),
            if (oneCartState is OneCartError) Text(oneCartState.message),
            if (oneCartState is OneCartSuccess)
              Expanded(
                child: Card(
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: widget.products.length,
                      itemBuilder: (context, index) {
                        final product = widget.products[index];
                        return Card(
                          child: ListTile(
                            leading: Image.network(product.thumbnail),
                            title: Text(product.quantity.toString()),
                            subtitle: Text("\$${product.price}"),
                          ),
                        );
                      },
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
