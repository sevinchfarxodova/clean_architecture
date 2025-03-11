import 'package:clean_architecture/features/auth/presentation/riverpod/auth_provider.dart';
import 'package:clean_architecture/features/auth/presentation/riverpod/auth_state.dart';
import 'package:clean_architecture/features/user_info/presentation/pages/user_info_page.dart';
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
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => UserInfoPage(),
      //   ),
      // );
    }

  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next is AuthSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UserInfoPage()),
        );
      } else if (next is AuthError) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message)),
        );
      }
    });
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
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            ElevatedButton(
              onPressed: _login,
              child: Text('Sign in '), ),
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
