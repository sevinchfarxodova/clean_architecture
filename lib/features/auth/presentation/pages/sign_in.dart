// import 'package:clean_architecture/features/user_info/presentation/pages/user_info_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class SignIn extends StatelessWidget {
//   const SignIn({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 'Sign In',
//                 style: TextStyle(fontSize: 28, color: Colors.black,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 14),
//               TextField(
//               //  controller: usernameController,
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(
//                     Icons.supervised_user_circle,
//                     color: Colors.purpleAccent,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Password TextField
//               TextField(
//               //  controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(
//                     Icons.password_rounded,
//                     color: Colors.purpleAccent,
//                   ),
//                 ),
//                 textInputAction: TextInputAction.done,
//               ),
//               SizedBox(height: 30),
//
//               ElevatedButton(
//                 onPressed: () {
//                  // Navigator.push(
//                    // context,
//                     // MaterialPageRoute(
//                     //  // builder: (context) => UserInfoPage(),
//                     // ),
//                 //  );
//                   ScaffoldMessenger.of(
//                     context,
//                   ).showSnackBar(SnackBar(content: Text('Signing In...')));
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//                 child: Text(
//                   'Sign In',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//

import 'package:clean_architecture/features/auth/presentation/riverpod/auth_provider.dart';
import 'package:clean_architecture/features/auth/presentation/riverpod/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    if (username.isNotEmpty && password.isNotEmpty) {
      ref.read(authNotifierProvider.notifier).signIn(username, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "LOG IN",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            SizedBox(height: 8),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Sign in ')),
            SizedBox(height: 20),
            if (authState is AuthLoading) CircularProgressIndicator(),
            if (authState is AuthError)
              Text(authState.message, style: TextStyle(color: Colors.red)),
            if (authState is AuthSuccess)
              Text(
                "Welcome ${authState.user.firstName}",
                style: TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
