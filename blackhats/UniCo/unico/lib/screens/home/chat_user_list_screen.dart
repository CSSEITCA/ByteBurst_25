import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user_model.dart';
import '../../utils/constant.dart';
import 'chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../utils/constant.dart';


class ChatUserListScreen extends StatefulWidget {
  final String currentUserId;

  const ChatUserListScreen({super.key, required this.currentUserId});

  @override
  State<ChatUserListScreen> createState() => _ChatUserListScreenState();
}

class _ChatUserListScreenState extends State<ChatUserListScreen> {
  List<UserModel> _users = [];

  @override
  void initState() {
    super.initState();
    fetchUsersWithCommonInterests();
  }

  Future<void> fetchUsersWithCommonInterests() async {
    final currentUserSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.currentUserId)
        .get();

    if (!currentUserSnapshot.exists) return;

    final List<dynamic> myInterests = currentUserSnapshot.data()?['interests'] ?? [];

    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    final allUsers = snapshot.docs
        .where((doc) => doc.id != widget.currentUserId)
        .map((doc) => UserModel.fromMap(doc.data()))
        .toList();

    setState(() {
      _users = allUsers
          .where((user) => user.interests.any((interest) => myInterests.contains(interest)))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with People'),
        backgroundColor: Color.fromARGB(233, 10, 10, 197),
      ),
      body: _users.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(user.name),
                  subtitle: Text("Interests: ${user.interests.join(', ')}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(
                          currentUserId: widget.currentUserId,
                          otherUser: user,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
