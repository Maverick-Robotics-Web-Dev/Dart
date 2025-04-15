import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          'Hola Chavez!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Color.fromRGBO(13, 71, 161, 1),
            letterSpacing: 1.5,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
