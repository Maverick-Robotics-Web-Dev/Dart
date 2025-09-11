import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/pin_code_text_form_field_custom.dart';
import 'package:flutter/material.dart';

class VerificationCodeTabletScreen extends StatefulWidget {
  final double maxHeight;
  final double maxWidth;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const VerificationCodeTabletScreen({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    this.textTheme,
    this.formKey,
  });

  @override
  State<VerificationCodeTabletScreen> createState() =>
      _VerificationCodeTabletScreenState();
}

class _VerificationCodeTabletScreenState
    extends State<VerificationCodeTabletScreen> {
  @override
  Widget build(BuildContext context) {
    final num sumsqsides = pow(widget.maxHeight, 2) + pow(widget.maxWidth, 2);
    final double diagonal = sqrt(sumsqsides);
    print('DIAGONAL: ${diagonal * 0.0313}');
    print('DIAG: ${diagonal * 0.023}');
    print('Diagonal: ${diagonal * 0.02931}');

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: widget.maxHeight,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                    color: whiteColor,
                    iconSize: diagonal * 0.02432,
                  ),
                ),
                SizedBox(height: 60),
                Text(
                  'Código de verificación',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: diagonal * 0.023,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hemos enviado el código de verificación a',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: diagonal * 0.01122,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'andrwchvez7690@gmail.com',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: diagonal * 0.01122,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PinCodeTextFormFieldCustom(),
                    SizedBox(width: 26),
                    PinCodeTextFormFieldCustom(),
                    SizedBox(width: 26),
                    PinCodeTextFormFieldCustom(),
                    SizedBox(width: 26),
                    PinCodeTextFormFieldCustom(),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  'Reenviar código después 1:36',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: diagonal * 0.01122,
                    letterSpacing: 1,
                  ),
                ),
                Spacer(),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor,
                        ),
                        child: Text(
                          'Reenviar',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: diagonal * 0.0122,
                            letterSpacing: 1,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Confirmar',
                          style: TextStyle(
                            fontSize: diagonal * 0.0122,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
