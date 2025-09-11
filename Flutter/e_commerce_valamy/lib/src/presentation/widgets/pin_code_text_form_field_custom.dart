import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinCodeTextFormFieldCustom extends StatelessWidget {
  const PinCodeTextFormFieldCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: 70,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        // maxLength: 1,
        // maxLengthEnforcement: MaxLengthEnforcement.none,
        style: TextStyle(fontSize: 40),
        decoration: InputDecoration(
          // counterText: '',
          contentPadding: EdgeInsets.symmetric(vertical: 70),
        ),
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
      ),
    );
  }
}
