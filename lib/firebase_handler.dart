import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'data/repositories/task_repository.dart';

class FirebaseMessagingHandler {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<String?> getFcmToken() async {
    final messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    String? token = await messaging.getToken();
    if (token != null) {
      sendFCM({"token": token});
    }
    return token;
  }

  Future<void> sendFCM(Map<String, dynamic> values) async {
    try {
      final result = await TaskRepositoryIml().postData(values, "save-token");
    } catch (e) {
      print(e);
    }
  }

  static initMessaging() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');

        if (message.notification != null) {
          const iOSPlatformChannelSpecifics = DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            threadIdentifier:
                'com.google.firebase.messaging.default_notification_channel_id',
            // categoryIdentifier: darwinNotificationActionCategory,
          );
          const platformChannelSpecifics = NotificationDetails(
            iOS: iOSPlatformChannelSpecifics,
          );
          await flutterLocalNotificationsPlugin.show(
            01, // Notification ID
            message.notification!.title,
            message.notification!.body,
            platformChannelSpecifics,
          );
          print(
              'Message also contained a notification: ${message.notification}');
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp
        .listen((RemoteMessage message) async {});
  }
}
