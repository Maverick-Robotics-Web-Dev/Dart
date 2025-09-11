import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class VerificationCodeMobileScreen extends StatefulWidget {
  final double maxHeight;
  final double maxWidth;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const VerificationCodeMobileScreen({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    this.textTheme,
    this.formKey,
  });

  @override
  State<VerificationCodeMobileScreen> createState() =>
      _VerificationCodeMobileScreenState();
}

class _VerificationCodeMobileScreenState
    extends State<VerificationCodeMobileScreen> {
  @override
  Widget build(BuildContext context) {
    final num sumsqsides = pow(widget.maxHeight, 2) + pow(widget.maxWidth, 2);
    final double diagonal = sqrt(sumsqsides);
    print('Font Size: ${diagonal * 0.02931}');

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: widget.maxHeight,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                    color: whiteColor,
                    iconSize: diagonal * 0.02931,
                  ),
                ),
                SizedBox(height: 60),
                Text(
                  'Código de verificación',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: diagonal * 0.0313,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Hemos enviado el código de verificación a',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: diagonal * 0.0163,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'andrwchvez7690@gmail.com',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: diagonal * 0.0163,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 70,
                      // decoration: BoxDecoration(
                      //   color: Colors.red,
                      //   borderRadius: BorderRadius.circular(12),
                      // ),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 70),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 70,
                      // decoration: BoxDecoration(
                      //   color: Colors.red,
                      //   borderRadius: BorderRadius.circular(12),
                      // ),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 70),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 70,
                      // decoration: BoxDecoration(
                      //   color: Colors.red,
                      //   borderRadius: BorderRadius.circular(12),
                      // ),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 70),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 70,
                      // decoration: BoxDecoration(
                      //   color: Colors.red,
                      //   borderRadius: BorderRadius.circular(12),
                      // ),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 70),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Reenviar código después 1:36',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: diagonal * 0.0163,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
