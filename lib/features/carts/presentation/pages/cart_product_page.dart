import 'package:clean_architecture/features/carts/domain/entities/cart._product.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/route_names.dart';

class CartProductPage extends StatelessWidget {
  final List<ProductCart> products;

  const CartProductPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "Carts",
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 16,
            childAspectRatio: 5.8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.oneCartPage,
                  arguments: {
                    'cartId': product.id.toString(),
                    'products': products,
                  },
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      product.thumbnail.toString(),
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            product.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Price: \$${product.price}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RouteNames.addCartPage);
                          },
                          icon: Icon(Icons.add, size: 24, color: Colors.pinkAccent),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RouteNames.deleteCartPage);
                          },
                          icon: Icon(Icons.delete_outline_outlined, size: 24, color: Colors.red),
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
    );
  }
}
