import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class RowElevatedButtonCustom extends StatelessWidget {
  final String textCondition;
  final VoidCallback onLeftFilterPressed;
  final VoidCallback onRightFilterPressed;
  final String leftButtonText;
  final String rightButtonText;

  const RowElevatedButtonCustom({
    super.key,
    required this.textCondition,
    required this.onLeftFilterPressed,
    required this.onRightFilterPressed,
    this.leftButtonText = 'Ingrese Texto',
    this.rightButtonText = 'Ingrese Texto',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  textCondition == leftButtonText ? primaryColor : whiteColor,
              side: BorderSide(
                color:
                    textCondition == leftButtonText
                        ? primaryColor
                        : Colors.grey,
              ),
            ),
            onPressed: onLeftFilterPressed,
            child: Text(
              leftButtonText,
              style: TextStyle(
                fontSize: 16,
                color:
                    textCondition == leftButtonText ? whiteColor : primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  textCondition == rightButtonText ? primaryColor : whiteColor,
              side: BorderSide(
                color:
                    textCondition == rightButtonText
                        ? primaryColor
                        : Colors.grey,
              ),
            ),
            onPressed: onRightFilterPressed,
            child: Text(
              rightButtonText,
              style: TextStyle(
                fontSize: 16,
                color:
                    textCondition == rightButtonText
                        ? whiteColor
                        : primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
