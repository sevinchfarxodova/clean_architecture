import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneProductInfo extends StatelessWidget {
  const OneProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('One Product info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           //   Image.network(product!.thumbnail, height: 200, width: 200),
              SizedBox(height: 10),
              Text("",
               // product!.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
        //      Text(product!.description, style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text("",
             //   'Price: \$${product!.price}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text("",
                //'Rating: ${product!.rating}',
                style:  TextStyle(fontSize: 16),
              ),
              Text(
               "",
                //'Rating: ${product!.description}',
                style:  TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      )
    );
  }
}
