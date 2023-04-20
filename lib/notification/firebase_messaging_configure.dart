import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


void configureFirebaseMessaging(Function(RemoteMessage) onNotificationReceived) {

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('onMessage: $message');
    onNotificationReceived(message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint('onLaunch: $message');
    onNotificationReceived(message);
  });

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print('Handling a background message: ${message.messageId}');
  }

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

}