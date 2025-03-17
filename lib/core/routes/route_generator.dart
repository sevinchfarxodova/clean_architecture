import 'package:clean_architecture/core/routes/route_names.dart';
import 'package:clean_architecture/features/auth/presentation/pages/sign_in.dart';
import 'package:clean_architecture/features/home/presentation/pages/categories_page.dart';
import 'package:clean_architecture/features/home/presentation/pages/one_product_info.dart';
import 'package:flutter/cupertino.dart';
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
