import 'package:clean_architecture/features/carts/presentation/pages/carts_page.dart';
import 'package:clean_architecture/features/home/presentation/pages/all_products.dart';
import 'package:clean_architecture/features/auth/data/models/user_model.dart';
import 'package:clean_architecture/features/auth/presentation/riverpod/auth_state.dart';
import 'package:clean_architecture/features/user_info/presentation/providers/user_provider.dart';
import 'package:clean_architecture/features/user_info/presentation/providers/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/riverpod/auth_provider.dart';
import '../../../home/presentation/pages/one_product_info.dart';

class UserInfoPage extends ConsumerStatefulWidget {
  const UserInfoPage({super.key});

  @override
  ConsumerState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends ConsumerState<UserInfoPage> {
  UserModel? user;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getUserInfo());
    super.initState();
  }

  void getUserInfo() {
    final authState = ref.watch(authNotifierProvider);
    if (authState is AuthSuccess) {
      ref
          .read(userInfoNotifierProvider.notifier)
          .userInfo(authState.user.accessToken);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userInfoNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("User Info", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            if (userState is UserSuccess)
              Column(
                children: [
                  Text(
                    "FirstName: ${userState.user.firstName} ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "LastName: ${userState.user.username}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " Gender: ${userState.user.gender}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Email: ${userState.user.email}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Image.network(userState.user.image),
                ],
              ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OneProductInfo(productId: ''),
                    ),
                  );
                },
                child: Text("One product", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllProducts()),
                  );
                },
                child: Text("All products", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CartsPage(),
                    ),
                  );
                },
                child: Text(
                  " View Carts",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )

            ),
            SizedBox(height: 20),
            if (userState is UserLoading) CircularProgressIndicator(),
            if (userState is UserError) Text(userState.message),
          ],
        ),
      ),
    );
  }
}
