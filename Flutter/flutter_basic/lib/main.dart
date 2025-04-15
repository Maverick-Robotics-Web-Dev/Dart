import 'package:flutter/material.dart';
import 'package:flutter_basic/components/text.dart';
import 'package:flutter_basic/components/text_field.dart';
import 'package:flutter_basic/layouts/column.dart';
import 'package:flutter_basic/layouts/row.dart';

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
