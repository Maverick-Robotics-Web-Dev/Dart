import 'package:flutter/material.dart';
import 'package:flutter_basic/components/text_field.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: TextFieldExample()));
  }
}
