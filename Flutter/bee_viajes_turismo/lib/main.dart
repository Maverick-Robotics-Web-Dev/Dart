import 'package:bee_viajes_turismo/config/bloc_providers.dart';
import 'package:bee_viajes_turismo/presentation/blocs/blocs.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(statusBarColor: Colors.blue),
  // );
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationsBloc.initializeFCM();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        // home: Scaffold(body: Center(child: Text('Hello World!'))),
      ),
    );
  }
}
