import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;

  void requestNotificationPerimission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("user granted  provisional permission ");
    } else {
      print("user dinied permission ");
    }
  }

  Future<String> getDeviceToken() async {
    var token = await _messaging.getToken();
    return token ?? '';
  }
}
