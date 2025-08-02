import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message_model.dart';

class ChatService {
  final _firestore = FirebaseFirestore.instance;

  String _chatId(String user1, String user2) {
    return user1.hashCode <= user2.hashCode ? '$user1\_$user2' : '$user2\_$user1';
  }

  Stream<List<Message>> getMessages(String user1, String user2) {
    final chatId = _chatId(user1, user2);
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Message.fromMap(doc.data()))
            .toList());
  }

  Future<void> sendMessage(Message message) async {
    final chatId = _chatId(message.senderId, message.receiverId);
    await _firestore.collection('chats').doc(chatId).collection('messages').add(message.toMap());
  }
}
