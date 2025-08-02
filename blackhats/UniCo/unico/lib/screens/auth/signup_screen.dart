import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user_model.dart';
import '../home/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _department = TextEditingController();
  final _interests = TextEditingController();
  bool loading = false;

  void _signup() async {
    setState(() => loading = true);
    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );

      final newUser = UserModel(
        uid: cred.user!.uid,
        name: _name.text.trim(),
        email: _email.text.trim(),
        department: _department.text.trim(),
        interests: _interests.text.trim().split(","),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(cred.user!.uid)
          .set(newUser.toMap());

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signup failed: ${e.toString()}")),
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
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png", height: 100),
                  const SizedBox(height: 20),
                  TextField(controller: _name, decoration: const InputDecoration(labelText: "Full Name")),
                  TextField(controller: _email, decoration: const InputDecoration(labelText: "Email")),
                  TextField(controller: _department, decoration: const InputDecoration(labelText: "Department")),
                  TextField(controller: _interests, decoration: const InputDecoration(labelText: "Interests (comma-separated)")),
                  TextField(controller: _password, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: loading ? null : _signup,
                    child: loading
                        ? const CircularProgressIndicator()
                        : const Text("Sign Up"),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}