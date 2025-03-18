import 'package:clean_architecture/features/home/presentation/providers/one_product_provider.dart';
import 'package:clean_architecture/features/home/presentation/providers/single_product/one_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OneProductInfo extends ConsumerStatefulWidget {
  final String productId;

  const OneProductInfo({super.key, required this.productId});

  @override
  ConsumerState createState() => _OneProductInfoState();
}

class _OneProductInfoState extends ConsumerState<OneProductInfo> {
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(oneProductNotifierProvider.notifier)
          .oneProduct(widget.productId);
    });
  }

  void updateProduct({required int id, required String newTitle}) {
    ref.watch(oneProductNotifierProvider.notifier).updateProduct(id, newTitle);
  }

  @override
  Widget build(BuildContext context) {
    final oneProductState = ref.watch(oneProductNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "One Product",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Change title..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                prefixIcon: IconButton(
                  onPressed: () {
                    if (oneProductState is OneProductSuccess) {
                      updateProduct(
                        id: oneProductState.product.id!,
                        newTitle: titleController.text.trim(),
                      );
                    }
                  },
                  icon: Icon(Icons.update, color: Colors.orange, size: 28),
                ),
              ),
            ),

            if (oneProductState is OneProductLoading)
              const Center(child: CircularProgressIndicator()),
            if (oneProductState is OneProductError)
              Text(
                oneProductState.message,
                style: const TextStyle(color: Colors.red),
              ),
            if (oneProductState is OneProductSuccess)
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          oneProductState.product.thumbnail,
                          height: 200,
                          width: 200,
                        ),
                        Text(
                          oneProductState.product.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          oneProductState.product.description,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Rating description: ${oneProductState.product.description}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Rating: ${oneProductState.product.rating}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Price: \$${oneProductState.product.price}',
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Rating: ${oneProductState.product.tags}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Rating: ${oneProductState.product.warrantyInformation}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Weight: ${oneProductState.product.weight}',
                          style: TextStyle(fontSize: 16),
                        ),
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
