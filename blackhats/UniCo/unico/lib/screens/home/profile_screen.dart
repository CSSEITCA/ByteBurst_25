import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  bool loading = true;
  Map<String, dynamic>? userData;

  final _nameController = TextEditingController();
  final _departmentController = TextEditingController();
  final _interestsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() async {
    final doc = await FirebaseFirestore.instance.collection("users").doc(uid).get();
    userData = doc.data();
    _nameController.text = userData?['name'] ?? "";
    _departmentController.text = userData?['department'] ?? "";
    _interestsController.text = (userData?['interests'] as List).join(", ");
    setState(() => loading = false);
  }

  void _saveProfile() async {
    await FirebaseFirestore.instance.collection("users").doc(uid).update({
      "name": _nameController.text.trim(),
      "department": _departmentController.text.trim(),
      "interests": _interestsController.text.trim().split(","),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile updated")),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Center(child: CircularProgressIndicator());
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 255, 239, 182),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/profile_placeholder.png"),
              ),
              const SizedBox(height: 24),
              TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Name")),
              TextField(controller: _departmentController, decoration: const InputDecoration(labelText: "Department")),
              TextField(controller: _interestsController, decoration: const InputDecoration(labelText: "Interests")),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: _saveProfile, child: const Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}