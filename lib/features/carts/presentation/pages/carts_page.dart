import 'package:clean_architecture/core/routes/route_names.dart';
import 'package:clean_architecture/features/carts/presentation/providers/all_cart_provider.dart';
import 'package:clean_architecture/features/carts/presentation/providers/all_cart/all_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartsPage extends ConsumerStatefulWidget {
  const CartsPage({super.key});

  @override
  ConsumerState createState() => _CartsPageState();
}

class _CartsPageState extends ConsumerState<CartsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      allCart();
    });
  }

  void allCart() {
    ref.read(allCartNotifierProvider.notifier).allCartData();
  }

  @override
  Widget build(BuildContext context) {
    final allCartState = ref.watch(allCartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "All Carts",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (allCartState is AllCartLoading)
              Center(child: CircularProgressIndicator()),
            if (allCartState is AllCartError) Text(allCartState.message),
            if (allCartState is AllCartSuccess)
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 12,
                    childAspectRatio: 5.5,
                  ),
                  itemCount: allCartState.allCarts.carts.length,
                  itemBuilder: (context, index) {
                    final allCarts = allCartState.allCarts.carts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.cartProductPage,
                          arguments: allCarts.products,
                        );
                      },
                      child: Container(
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                allCarts.id.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                "Total count:${allCarts.totalQuantity.toString()}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
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
