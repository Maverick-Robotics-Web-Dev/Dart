import 'package:bee_viajes_turismo/domain/entities/entities.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationsEvent {
  const NotificationsEvent();
}

class NotificationStatusChanged extends NotificationsEvent {
  final AuthorizationStatus status;

  NotificationStatusChanged({required this.status});
}

class NotificationReceived extends NotificationsEvent {
  final PushMessage pushMessage;

  NotificationReceived({required this.pushMessage});
}
