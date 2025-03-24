import 'package:clean_architecture/features/home/data/models/product_model.dart';
import 'package:clean_architecture/features/home/presentation/providers/add_product/add_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/one_product_provider.dart';

class AddProduct extends ConsumerStatefulWidget {
  const AddProduct({super.key});

  @override
  ConsumerState createState() => _AddProductState();
}

class _AddProductState extends ConsumerState<AddProduct> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void addProduct() {
    DimensionsModel dm = DimensionsModel(depth: 1.0);
    MetaModel metaModel = MetaModel(
      createdAt: "4",
      updatedAt: "t",
      barcode: "",
      qrCode: "",
    );
    ReviewModel reviewModel = ReviewModel(
      rating: 5,
      comment: "",
      date: DateTime.now(),
      reviewerName: "reviewerName",
      reviewerEmail: "reviewerEmail",
    );

    ProductModel productModel = ProductModel(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        category: "category",
        price: 10.0,
        discountPercentage: 10.0,
        rating: 10.0,
        stock: 0,
        tags: [],
        brand: "brand",
        sku: "sku",
        weight: 0,
        dimensions: dm,
        warrantyInformation: "warrantyInformation",
        shippingInformation: "shippingInformation",
        availabilityStatus: "availabilityStatus",
        reviews: [reviewModel],
        returnPolicy: "returnPolicy",
        meta: metaModel,
        images: [],
        thumbnail: "thumbnail");
    ref.read(addProductProvider.notifier).addProduct(productModel);
  }

  @override
  Widget build(BuildContext context) {
    final addState = ref.watch(addProductProvider);
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
                decoration: InputDecoration(labelText: "Change title")),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Change description"),
            ),
            ElevatedButton(onPressed: () {
              addProduct();
            }, child: Text("Add")),
            SizedBox(
              height: 20,
            ),
            if(addState is AddProductLoading)
              CircularProgressIndicator(),
            if(addState is AddProductError)
              Text(addState.message),
            if(addState is AddProductLoaded)
              Expanded(
                child: Column(
                  children: [
                    Text(addState.productModel.title,   style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),),
                    Text(addState.productModel.price.toString(),  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),),
                    Text(addState.productModel.discountPercentage.toString(),
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}