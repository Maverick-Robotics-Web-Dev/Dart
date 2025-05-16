import 'package:flutter/material.dart';
import 'package:indrive_app/injection.dart';
import 'package:indrive_app/presentation/screens/main/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MainScreen());
}
