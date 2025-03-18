import 'package:clean_architecture/core/routes/route_names.dart';
import 'package:clean_architecture/features/home/presentation/providers/categories_product/categories_state.dart';
import 'package:clean_architecture/features/home/presentation/providers/one_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoriesProduct();
    });
  }

  void categoriesProduct() {
    ref.read(categoriesProductNotifierProvider.notifier).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesState = ref.watch(categoriesProductNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Category products",
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
            if (categoriesState is CategoriesLoading)
              Center(child: CircularProgressIndicator()),
            if (categoriesState is CategoriesError)
              Text(
                categoriesState.message,
                style: const TextStyle(color: Colors.red),
              ),
            if (categoriesState is CategoriesSuccess)
              Expanded(
                child: ListView.builder(
                 itemCount: categoriesState.categories.length,
                  itemBuilder: (context, index) {
                    final categories = categoriesState.categories[index];
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.byCategoryPage,
                          arguments: {
                            "url": categories.url,
                            "name": categories.name,
                          },
                        );
                      },
                        leading:Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8,),
                              Text(
                                categories.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),




                      // subtitle: Text(
                      //   categories.url ?? "",
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
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
