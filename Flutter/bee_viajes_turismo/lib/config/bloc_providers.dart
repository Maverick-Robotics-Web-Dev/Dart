import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/presentation/presentation.dart';
import 'package:bee_viajes_turismo/presentation/blocs/sign_up/sign_up_event.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<SignUpBloc>(
    create: (context) =>
        SignUpBloc()..add(SignUpInit(formStatus: FormStatus.invalid)),
  ),
  BlocProvider<NotificationsBloc>(
    create: (context) => NotificationsBloc(
      requestLocalNotificationPermissions:
          LocalNotifications.requestPermissionLocalNotifications,
      showLocalNotification: LocalNotifications.showLocalNotification,
    ),
  ),
  BlocProvider<SignInFormBloc>(create: (context) => SignInFormBloc()),
  BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
];
