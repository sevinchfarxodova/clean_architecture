import 'package:clean_architecture/features/home/presentation/providers/delete_product/delete_state.dart';
import 'package:clean_architecture/features/home/presentation/providers/one_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeletePage extends ConsumerStatefulWidget {
  const DeletePage({super.key});

  @override
  ConsumerState createState() => _DeletePageState();
}

class _DeletePageState extends ConsumerState<DeletePage> {
  TextEditingController deleteController = TextEditingController();

  void deleteProduct({required int id}) {
    ref.watch(deleteProductProvider.notifier).deleteProductInfo(id);
  }

  @override
  Widget build(BuildContext context) {
    final deleteState = ref.watch(deleteProductProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Add Product",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Product ID to delete",
                suffixIcon: ElevatedButton(
                  onPressed: () {
                    deleteProduct(id: int.parse(deleteController.text.trim()));
                  },
                  child: Icon(Icons.delete, color: Colors.redAccent, size: 26),
                ),
              ),
              controller: deleteController,
              keyboardType: TextInputType.number,
            ),

            if (deleteState is DeleteProductLoading)
              Center(child: CircularProgressIndicator()),
            if (deleteState is DeleteProductError) Text(deleteState.message),
            if (deleteState is DeleteProductSuccess)
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          deleteState.product.thumbnail,
                          height: 200,
                          width: 200,
                        ),
                        Text(
                          deleteState.product.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          deleteState.product.description,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Rating description: ${deleteState.product.description}',
                          style: TextStyle(fontSize: 16),
                        ),

                        SizedBox(height: 10),
                        Text(
                          'Price: \$${deleteState.product.price}',
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Rating: ${deleteState.product.tags}',
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
