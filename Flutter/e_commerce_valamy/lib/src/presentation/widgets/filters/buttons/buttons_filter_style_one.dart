import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class ButtonsFilterStyleOne extends StatelessWidget {
  final String option;
  final VoidCallback onLeftFilterPressed;
  final VoidCallback onRightFilterPressed;
  final String? leftButtonText;
  final String? rightButtonText;

  const ButtonsFilterStyleOne({
    super.key,
    required this.option,
    required this.onLeftFilterPressed,
    required this.onRightFilterPressed,
    this.leftButtonText,
    this.rightButtonText,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('Option ButtonsFilterStyleOne: $option');

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: option == 'Filter' ? primaryColor : whiteColor,
                side: BorderSide(
                  color: option == 'Filter' ? primaryColor : Colors.grey,
                ),
              ),
              onPressed: onLeftFilterPressed,
              child: Text(
                leftButtonText != null ? leftButtonText! : 'Filter',
                style: TextStyle(
                  fontSize: 17,
                  color: option == 'Filter' ? whiteColor : primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: option == 'Sort' ? primaryColor : whiteColor,
                side: BorderSide(
                  color: option == 'Sort' ? primaryColor : Colors.grey,
                ),
              ),
              onPressed: onRightFilterPressed,
              child: Text(
                rightButtonText != null ? rightButtonText! : 'Sort',
                style: TextStyle(
                  fontSize: 17,
                  color: option == 'Sort' ? whiteColor : primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
