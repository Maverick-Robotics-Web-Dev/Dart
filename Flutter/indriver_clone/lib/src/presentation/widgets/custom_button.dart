import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? fringe;
  final Color? backdropColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    this.fringe = const EdgeInsets.all(0),
    this.backdropColor = Colors.white,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: fringe,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: backdropColor),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
