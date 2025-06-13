import 'package:flutter/material.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(child: Text('ROLES PAGE'))));
  }
}
