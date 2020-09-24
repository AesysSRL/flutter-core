import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../service_locator_initializer.dart';

Future initializeLocalNotification(SelectNotificationCallback selectNotification, DidReceiveLocalNotificationCallback onDidReceiveNotification) async {
  final initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  final initializationSettingsIOS = IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveNotification);
  await getIt<FlutterLocalNotificationsPlugin>()
      .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(alert: true, badge: true, sound: true,);
  final initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
  await getIt<FlutterLocalNotificationsPlugin>().initialize(initializationSettings, onSelectNotification: selectNotification);
}