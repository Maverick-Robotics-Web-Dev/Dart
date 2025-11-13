import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class BottomButtonFilterStyleOne extends StatelessWidget {
  final String? bottomButtonText;

  const BottomButtonFilterStyleOne({super.key, this.bottomButtonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          backgroundColor: primaryColor,
        ),
        onPressed: () {},
        child: Text(
          bottomButtonText != null ? bottomButtonText! : 'Done',
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
