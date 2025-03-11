// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class OneProductInfo extends StatelessWidget {
//   const OneProductInfo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('One Product info')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//            //   Image.network(product!.thumbnail, height: 200, width: 200),
//               SizedBox(height: 10),
//               Text("",
//                // product!.title,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//         //      Text(product!.description, style: TextStyle(fontSize: 16)),
//               SizedBox(height: 10),
//               Text("",
//              //   'Price: \$${product!.price}',
//                 style: TextStyle(fontSize: 16, color: Colors.black),
//               ),
//               SizedBox(height: 10),
//               Text("",
//                 //'Rating: ${product!.rating}',
//                 style:  TextStyle(fontSize: 16),
//               ),
//               Text(
//                "",
//                 //'Rating: ${product!.description}',
//                 style:  TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       )
//     );
//   }
// }

import 'package:clean_architecture/features/home/presentation/providers/one_product_provider.dart';
import 'package:clean_architecture/features/home/presentation/providers/one_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/one_product_widget.dart';

class OneProductInfo extends ConsumerStatefulWidget {
  const OneProductInfo({super.key});

  @override
  ConsumerState createState() => _OneProductInfoState();
}

class _OneProductInfoState extends ConsumerState<OneProductInfo> {
  final TextEditingController idController = TextEditingController();

  void _oneProduct() {
    final id = idController.text.trim();
    if (id.isNotEmpty) {
      ref.read(oneProductNotifierProvider.notifier).oneProduct(id);
    }
  }


  @override
  Widget build(BuildContext context) {
    final oneProductState = ref.watch(oneProductNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "One product",
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
              controller: idController,
              decoration: InputDecoration(labelText: "Enter number"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _oneProduct, child: Text('One Product info '), ),
            SizedBox(height: 20),
            if (oneProductState is OneProductLoading) CircularProgressIndicator(),
            if (oneProductState is OneProductError)
              Text(oneProductState.message, style: TextStyle(color: Colors.red)),
            if (oneProductState is OneProductSuccess)
              OneProductWidget(product: oneProductState.product,)

          ],
        ),
      ),
    );
  }
}
