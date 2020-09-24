import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

void configureFirebaseMessaging(Function(Map<String, dynamic>) onNotificationReceived) {
  FirebaseMessaging().configure(
    onMessage: (message) async {
      debugPrint('onMessage: $message');
      onNotificationReceived(_jsonMap(message));
    },
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