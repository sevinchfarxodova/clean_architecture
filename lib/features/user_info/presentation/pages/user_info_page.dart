import 'package:clean_architecture/features/home/presentation/pages/one_product_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("Home", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Text("",
            //  "FirstName: ${userFullModel!.firstName } ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("",
              //"Gender: ${userFullModel!.gender}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("",
           //   "Age: ${userFullModel!.age}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("",
             // "Phone: ${userFullModel!.phone}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("",
             // "Gmail: ${userFullModel!.email}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => OneProductInfo(),
                   ),
                 );
                },
                child: Text("One product"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
