import 'package:clean_architecture/core/routes/route_names.dart';
import 'package:clean_architecture/features/home/presentation/providers/get_product_by_category/get_product_by_category_state.dart';
import 'package:clean_architecture/features/home/presentation/providers/one_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductByCategory extends ConsumerStatefulWidget {
  final Map<String, String> data;

  const ProductByCategory({super.key, required this.data});

  @override
  ConsumerState createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends ConsumerState<ProductByCategory> {
  void getProduct({required String url}) {
    ref
        .read(getProductByCategoryProvider.notifier)
        .getProductsByCategory(url: url);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getProduct(url: widget.data['url']!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(getProductByCategoryProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          widget.data['name']!,
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (productsState is GetProductByCategoryLoading)
              const Center(child: CircularProgressIndicator()),
            if (productsState is GetProductByCategoryError)
              Text(productsState.message),
            if (productsState is GetProductByCategorySuccess)
              Expanded(
                child: ListView.builder(
                  itemCount: productsState.allProduct.products.length,
                  itemBuilder: (context, index) {
                    final products = productsState.allProduct.products[index];
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.oneProductPage,
                          arguments:
                              products.id.toString(),
                        );
                      },
                      title: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 0,
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                products.thumbnail,
                                width: 70,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                             SizedBox(width: 10),
                            Column(
                              crossAxisAlignment:   CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products.title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                    Text(
                                      "\$${products.price.toString()}",
                                      style: const TextStyle(
                                        color: Colors.orange,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
