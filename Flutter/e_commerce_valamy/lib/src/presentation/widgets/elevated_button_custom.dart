import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final bool option;
  final VoidCallback press;
  final String textButton;

  const ElevatedButtonCustom({
    super.key,
    this.option = false,
    required this.press,
    this.textButton = 'Ingrese Texto',
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: option ? whiteColor : primaryColor,
          side: BorderSide(color: option ? Colors.grey : primaryColor),
        ),
        onPressed: press,
        child: Text(
          textButton,
          style: TextStyle(
            fontSize: 16,
            color: option ? primaryColor : whiteColor,
          ),
        ),
      ),
    );
  }
}
