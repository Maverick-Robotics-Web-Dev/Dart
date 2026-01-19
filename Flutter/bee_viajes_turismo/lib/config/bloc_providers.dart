import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/presentation/blocs/auth/auth_event.dart';
import 'package:bee_viajes_turismo/presentation/blocs/products/products_event.dart';
import 'package:bee_viajes_turismo/presentation/presentation.dart';
import 'package:bee_viajes_turismo/presentation/blocs/auth/sign_up/sign_up_event.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static List<BlocProvider> blocProviders = [
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
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc()..add(CheckAuthStatus()),
    ),
    BlocProvider<ProductsBloc>(
      create: (context) => ProductsBloc()..add(LoadProducts()),
    ),
    BlocProvider<ProductFormBloc>(create: (context) => ProductFormBloc()),
    BlocProvider<ProductBloc>(create: (context) => ProductBloc()),
  ];

  static List<BlocProvider> paramProviders(String productId) => [];
}
