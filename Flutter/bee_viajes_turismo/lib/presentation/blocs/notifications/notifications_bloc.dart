import 'dart:io';

import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/domain/entities/entities.dart';
import 'package:bee_viajes_turismo/firebase_options.dart';
import 'package:bee_viajes_turismo/presentation/blocs/notifications/notifications_event.dart';
import 'package:bee_viajes_turismo/presentation/blocs/notifications/notifications_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  int pushNumberId = 0;

  NotificationsBloc() : super(NotificationsState()) {
    on<NotificationStatusChanged>(_onNotificationStatusChanged);
    on<NotificationReceived>(_onNotificationReceived);
    _initialStatusCheck();
    _foregroundMessage();
  }

  void _onNotificationStatusChanged(
    NotificationStatusChanged event,
    Emitter<NotificationsState> emit,
  ) {
    emit(state.copyWith(status: event.status));
    _getFCMToken();
  }

  void _onNotificationReceived(
    NotificationReceived event,
    Emitter<NotificationsState> emit,
  ) {
    emit(
      state.copyWith(
        notifications: [event.pushMessage, ...state.notifications],
      ),
    );
  }

  static Future<void> initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(status: settings.authorizationStatus));
  }

  void _getFCMToken() async {
    if (state.status != AuthorizationStatus.authorized) return;

    final token = await messaging.getToken();

    print('TOKEN:$token');
  }

  void handleRemoteMessage(RemoteMessage message) {
    if (message.notification == null) return;

    final notification = PushMessage(
      messageId:
          message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '',
      title: message.notification!.title ?? '',
      body: message.notification!.body ?? '',
      sentDate: message.sentTime ?? DateTime.now(),
      data: message.data,
      imageUrl: Platform.isAndroid
          ? message.notification!.android?.imageUrl
          : message.notification!.apple?.imageUrl,
    );

    LocalNotifications.showLocalNotification(
      id: ++pushNumberId,
      title: notification.title,
      body: notification.body,
      data: notification.data.toString(),
    );

    add(NotificationReceived(pushMessage: notification));
  }

  void _foregroundMessage() {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
  }

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    await LocalNotifications.requestPermissionLocalNotifications();

    add(NotificationStatusChanged(status: settings.authorizationStatus));
  }

  PushMessage? getMessageById(String pushMessageId) {
    final exist = state.notifications.any(
      (element) => element.messageId == pushMessageId,
    );
    if (!exist) return null;

    return state.notifications.firstWhere(
      (element) => element.messageId == pushMessageId,
    );
  }
}
