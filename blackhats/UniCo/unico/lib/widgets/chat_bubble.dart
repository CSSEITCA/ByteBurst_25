import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final DateTime time;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Colors.indigo[200] : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
