import 'package:clean_architecture/core/routes/route_names.dart';
import 'package:clean_architecture/features/auth/presentation/pages/sign_in.dart';
import 'package:clean_architecture/features/carts/domain/entities/cart._product.dart';
import 'package:clean_architecture/features/carts/presentation/pages/add_cart_page.dart';
import 'package:clean_architecture/features/carts/presentation/pages/cart_product_page.dart';
import 'package:clean_architecture/features/carts/presentation/pages/carts_page.dart';
import 'package:clean_architecture/features/carts/presentation/pages/delete_cart_page.dart';
import 'package:clean_architecture/features/carts/presentation/pages/one_cart_info.dart';
import 'package:clean_architecture/features/home/presentation/pages/add_product.dart';
import 'package:clean_architecture/features/home/presentation/pages/categories_page.dart';
import 'package:clean_architecture/features/home/presentation/pages/delete_page.dart';
import 'package:clean_architecture/features/home/presentation/pages/one_product_info.dart';
import 'package:flutter/material.dart';
import '../../features/home/presentation/pages/product_by_category.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.signInPage:
        return MaterialPageRoute(builder: (_) => SignIn());

      case RouteNames.categoryPage:
        return MaterialPageRoute(builder: (_) => CategoriesPage());

      case RouteNames.byCategoryPage:
        final categoryData = routeSettings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => ProductByCategory(data: categoryData),
        );

      case RouteNames.oneProductPage:
        final productId = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => OneProductInfo(productId: productId),
        );

      case RouteNames.oneCartPage:
        final args = routeSettings.arguments as Map<String, dynamic>;
        final cartId = args['cartId'] as String;
        final products = args['products'] as List<ProductCart>;

        return MaterialPageRoute(
          builder: (context) => OneCartInfo(cartId: cartId, products: products),
        );


      case RouteNames.addProductPage:
        return MaterialPageRoute(builder: (_) => AddProduct());


      case RouteNames.addCartPage:
        return MaterialPageRoute(builder: (_) => AddCartPage());

      case RouteNames.allCartPage:
        return MaterialPageRoute(builder: (_) => CartsPage());

      case RouteNames.cartProductPage:
        final products = routeSettings.arguments as List<ProductCart>;
        return MaterialPageRoute(builder: (_) => CartProductPage(products: products));

      case RouteNames.deletePage:
        return MaterialPageRoute(builder: (_) => DeletePage());


      case RouteNames.deleteCartPage:
        return MaterialPageRoute(builder: (_) => DeleteCartPage());

      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Page not found')),
          ),
    );
  }
}
