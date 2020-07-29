import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

void configureFirebaseMessaging(Function(Map<String, dynamic>) onNotificationReceived,
//    SelectNotificationCallback selectNotification, DidReceiveLocalNotificationCallback onDidReceiveNotification
    ) {
  //    initializeLocalNotification(_selectNotification, _onDidReceiveLocalNotification);
  FirebaseMessaging().configure(
    onMessage: (message) async {
      debugPrint('onMessage: $message');
      onNotificationReceived(_jsonMap(message));
    },
//      onBackgroundMessage: backgroundMessageHandler,
    onLaunch: (message) async {
      debugPrint('onLaunch: $message');
      onNotificationReceived(_jsonMap(message));
    },
    onResume: (message) async {
      debugPrint('onResume: $message');
      onNotificationReceived(_jsonMap(message));
    },
  );
}

Map<String, dynamic> _jsonMap(Map<String, dynamic> message) {
  return json.decode(json.encode(message));
}
//Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) async {
//  await _showNotificationWithDefaultSound('title', message.toString());
//  return Future<void>.value();
//}
//
//Future _showNotificationWithDefaultSound(String title, String message) async {
//  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//  var androidPlatformChannelSpecifics =
//      AndroidNotificationDetails('channel_id', 'channel_name', 'channel_description', importance: Importance.Max, priority: Priority.High);
//  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//  var platformChannelSpecifics = NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//  await flutterLocalNotificationsPlugin.show(
//    0,
//    '$title',
//    '$message',
//    platformChannelSpecifics,
//    payload: 'Default_Sound',
//  );
//}