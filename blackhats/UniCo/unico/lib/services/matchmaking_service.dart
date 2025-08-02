import 'package:cloud_firestore/cloud_firestore.dart';

class MatchmakingService {
  final usersRef = FirebaseFirestore.instance.collection("users");

  Future<List<Map<String, dynamic>>> getMatchedUsers(String currentUid) async {
    final snapshot = await usersRef.get();
    final currentUser = snapshot.docs
        .firstWhere((doc) => doc.id == currentUid)
        .data();

    final currentInterests = List<String>.from(currentUser['interests']);
    final matches = <Map<String, dynamic>>[];

    for (var doc in snapshot.docs) {
      if (doc.id == currentUid) continue;

      final user = doc.data();
      final interests = List<String>.from(user['interests']);
      final common = interests.toSet().intersection(currentInterests.toSet());

      if (common.isNotEmpty) {
        matches.add(user);
      }
    }

    return matches;
  }
}