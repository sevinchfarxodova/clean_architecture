import 'package:clean_architecture/core/routes/route_names.dart';
import 'package:clean_architecture/features/home/presentation/providers/all_product/all_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/one_product_provider.dart';

class AllProducts extends ConsumerStatefulWidget {
  const AllProducts({super.key});

  @override
  ConsumerState createState() => _AllProductsState();
}

class _AllProductsState extends ConsumerState<AllProducts> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _allProduct();
    });
  }

  void _allProduct() {
    ref.read(allProductNotifierProvider.notifier).allProductInfo();
  }

  void searchProduct({required String query}) {
    ref.read(allProductNotifierProvider.notifier).searchProducts(query: query);
  }

  void sortAllProducts({required String sortName, required String acsDesc}) {
    ref
        .read(allProductNotifierProvider.notifier)
        .sortAllProduct(sortName: sortName, acsDesc: acsDesc);
  }

  @override
  Widget build(BuildContext context) {
    final allProductState = ref.watch(allProductNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          "All products",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.categoryPage);
            },
            icon: const Icon(
              Icons.category_outlined,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Search product...",
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.grey),
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: (String value) {
                searchProduct(query: value);
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    sortAllProducts(sortName: "price", acsDesc: "asc");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Ascending price",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    sortAllProducts(sortName: "title", acsDesc: "desc");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Descending price",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_upward_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (allProductState is AllProductLoading)
              const CircularProgressIndicator(),
            if (allProductState is AllProductError)
              Text(
                allProductState.message,
                style: const TextStyle(color: Colors.red),
              ),
            if (allProductState is AllProductSuccess)
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.83,
                  ),
                  itemCount: allProductState.allProduct.products.length,
                  itemBuilder: (context, index) {
                    final allProducts =
                        allProductState.allProduct.products[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.oneProductPage,
                          arguments: {"id": allProducts.id},
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 4,
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                allProducts.thumbnail,
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              allProducts.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                             // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "\$${allProducts.price.toString()}",
                                  style: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      RouteNames.addProductPage,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Colors.green,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      RouteNames.deletePage,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    size: 22,
                                    color: Colors.redAccent,
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
