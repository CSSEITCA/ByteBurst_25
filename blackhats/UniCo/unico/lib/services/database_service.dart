import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final usersRef = FirebaseFirestore.instance.collection("users");
  final eventsRef = FirebaseFirestore.instance.collection("events");
  final groupsRef = FirebaseFirestore.instance.collection("groups");

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final query = await usersRef.get();
    return query.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> fetchEvents() async {
    final query = await eventsRef.get();
    return query.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> fetchGroups() async {
    final query = await groupsRef.get();
    return query.docs.map((doc) => doc.data()).toList();
  }
}