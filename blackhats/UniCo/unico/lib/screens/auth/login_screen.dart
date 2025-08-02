import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/auth_service.dart';
import 'signup_screen.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;

  void _login() async {
    setState(() => loading = true);
    final user = await AuthService().loginUser(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (user != null && context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login failed")),
      );
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset("assets/images/auth_background.png", fit: BoxFit.cover, height: double.infinity),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", height: 150),
                const SizedBox(height: 40),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: "Email", focusedBorder: OutlineInputBorder()),
                  
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: "Password",suffixIcon: Icon(Icons.remove_red_eye), focusedBorder: OutlineInputBorder()),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: loading ? null : _login,
                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text("Login"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupScreen()),
                    );
                  },
                  child: const Text("Don’t have an account? Sign up"),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}