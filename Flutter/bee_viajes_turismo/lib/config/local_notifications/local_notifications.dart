import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static Future<void> requestPermissionLocalNotifications() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  static Future<void> initializeLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationSettingsAndroid = AndroidInitializationSettings(
      'app_icon',
    );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  static void showLocalNotification({
    required int id,
    String? title,
    String? body,
    String? data,
  }) {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('app_notification'),
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: data,
    );
  }

  static void onDidReceiveNotificationResponse(NotificationResponse response) {
    GoRouterConfig.appRouter().push(
      '$pathNotificationScreenRoute/${response.payload}',
    );
  }
}
