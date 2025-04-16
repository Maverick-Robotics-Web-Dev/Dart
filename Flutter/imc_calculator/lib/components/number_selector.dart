import 'package:flutter/material.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  const NumberSelector({super.key, required this.title});

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.title);
  }
}
