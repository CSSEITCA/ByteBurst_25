import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final _fcm = FirebaseMessaging.instance;

  Future<void> initialize() async {
    await _fcm.requestPermission();
    final token = await _fcm.getToken();
    print("FCM Token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("New message: ${message.notification?.title}");
    });
  }
}