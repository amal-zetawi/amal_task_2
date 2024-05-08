import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:operational/main.dart';
import 'notification_message.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification!.title}');
  print('Body: ${message.notification!.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  final firebaseMessageing = FirebaseMessaging.instance;
  final androidChannel = const AndroidNotificationChannel(
    "hight_importance_channel",
    "High Importance Notifications",
    description: "this channel is used for important notifications",
    importance: Importance.defaultImportance,
  );
  final localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        messageNotificationController!.updateMessage(
          NotificationMessage(
              title: message.notification!.title.toString(),
              body: message.notification!.body.toString(),
              payload: message.data),
        );
        final notification = message.notification;
        localNotifications.show(
          notification.hashCode,
          notification!.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              androidChannel.id,
              androidChannel.name,
              channelDescription: androidChannel.description,
              icon: "@drawable/ic_launcher",
            ),
          ),
          payload: jsonEncode(
            {
              "click_action": "FLUTTER_NOTIFICATION_CLICK",
              "status": "done",
              "screen": "/notificationPage"
            },
          ),
        );
      }
    });
  }

  Future<void> initNotifications() async {
    await firebaseMessageing.requestPermission();
    final fCMToken = await firebaseMessageing.getToken();
    print(fCMToken);
    prefs!.setString('token', fCMToken!);
    initPushNotification();
  }

  sendMessage(String title, String message, String id) async {
    var headersList = {
      'Accept': '*/*',
      'Authorization':
          'key=AAAAPM5Xjbk:APA91bFuE5JLn8KD9McB1WDOvtgDX3B7O5fBL0IBkOpJMGOx68WYunBvFf5MpO6nVLr_q5Z0pT8nZdl7XL7qZQNb9Wz78Uns957wygD7VEyiblO_C_i2Rcig_eGpC5p7gTQzxg5ZH7XS',
      'Content-Type': 'application/json'
    };
    var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    RemoteMessage remoteMessage = RemoteMessage(
      messageId: id,
      data: {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "status": "done",
        "sound": "default",
        "screen": "/notificationPage"
      },
      notification: RemoteNotification(
        body: message,
        title: title,
      ),
      senderId: prefs!.getString('token'),
    );
    remoteMessage.toMap();
    Map<String, dynamic> body = {
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "status": "done",
        "sound": "default",
        "screen": "/notificationPage"
      },
      "notification": {"body": message, "title": title, "sound": "default"},
      "to": prefs!.getString('token'),
    };
    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);
    var res = await req.send();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      NotificationMessage notificationMessage = NotificationMessage(
          title: title, body: message, payload: body['data']);
      messageNotificationController!.updateMessage(notificationMessage);
    } else {
      print("fail: ${res.reasonPhrase}");
    }
  }
}
