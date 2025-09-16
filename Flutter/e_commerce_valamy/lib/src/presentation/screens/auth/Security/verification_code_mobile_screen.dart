import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/pin_code_text_form_field_custom.dart';
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

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: widget.maxHeight,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BackButtonBox(diagonal: diagonal),
                SizedBox(
                  height: widget.maxHeight * 0.35,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/code_verification_white.webp',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                VerificationCodeTitleTextBox(diagonal: diagonal),
                SizedBox(height: 16),
                VerificationCodeTextBox(diagonal: diagonal),
                SizedBox(height: 4),
                EmailTextBox(diagonal: diagonal),
                SizedBox(height: 40),
                PinCodeTextBox(),
                SizedBox(height: 40),
                ResendCodeText(diagonal: diagonal),
                Spacer(),
                ButtonBox(diagonal: diagonal),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackButtonBox extends StatelessWidget {
  const BackButtonBox({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back),
        color: whiteColor,
        iconSize: diagonal * 0.02931,
      ),
    );
  }
}

class VerificationCodeTitleTextBox extends StatelessWidget {
  const VerificationCodeTitleTextBox({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Código de verificación',
      style: TextStyle(
        color: whiteColor,
        fontSize: diagonal * 0.0313,
        letterSpacing: 1,
      ),
    );
  }
}

class VerificationCodeTextBox extends StatelessWidget {
  const VerificationCodeTextBox({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hemos enviado el código de verificación a',
      style: TextStyle(
        color: whiteColor,
        fontSize: diagonal * 0.0163,
        letterSpacing: 1,
      ),
    );
  }
}

class EmailTextBox extends StatelessWidget {
  const EmailTextBox({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return Text(
      'andrwchvez7690@gmail.com',
      style: TextStyle(
        color: whiteColor,
        fontSize: diagonal * 0.0163,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
      ),
    );
  }
}

class PinCodeTextBox extends StatelessWidget {
  const PinCodeTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PinCodeTextFormFieldCustom(),
        PinCodeTextFormFieldCustom(),
        PinCodeTextFormFieldCustom(),
        PinCodeTextFormFieldCustom(),
      ],
    );
  }
}

class ResendCodeText extends StatelessWidget {
  const ResendCodeText({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Reenviar código después 1:36',
      style: TextStyle(
        color: whiteColor,
        fontSize: diagonal * 0.0163,
        letterSpacing: 1,
      ),
    );
  }
}

class ButtonBox extends StatelessWidget {
  const ButtonBox({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: whiteColor),
            child: Text(
              'Reenviar',
              style: TextStyle(
                color: primaryColor,
                fontSize: diagonal * 0.0163,
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
              style: TextStyle(fontSize: diagonal * 0.0163, letterSpacing: 1),
            ),
          ),
        ),
      ],
    );
  }
}
