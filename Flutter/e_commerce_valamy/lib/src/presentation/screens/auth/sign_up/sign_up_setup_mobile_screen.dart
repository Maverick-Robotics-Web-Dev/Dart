import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignUpSetupMobileScreen extends StatefulWidget {
  final double maxHeight;
  final double maxWidth;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignUpSetupMobileScreen({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    this.textTheme,
    this.formKey,
  });

  @override
  State<SignUpSetupMobileScreen> createState() =>
      _SignUpSetupMobileScreenState();
}

class _SignUpSetupMobileScreenState extends State<SignUpSetupMobileScreen> {
  @override
  Widget build(BuildContext context) {
    final num sumsqsides = pow(widget.maxHeight, 2) + pow(widget.maxWidth, 2);
    final double diagonal = sqrt(sumsqsides);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: SizedBox(
          height: widget.maxHeight,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Perfil',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: diagonal * 0.0215,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 40),
                CircleAvatar(
                  maxRadius: 66,
                  backgroundImage: AssetImage(
                    "assets/images/scarlett_johansson.jpg",
                  ),
                ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Upload Image",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: diagonal * 0.017,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                SizedBox(height: 28),
                Form(
                  key: widget.formKey,
                  child: Column(
                    children: [
                      TxtFormFieldCustom(
                        hintText: "Nombre",
                        svgPath: "assets/icons/Profile.svg",
                        keyboardType: TextInputType.emailAddress,
                        fontSize: diagonal * 0.0163,
                      ),
                      SizedBox(height: 20),
                      TxtFormFieldCustom(
                        hintText: "Apellido",
                        svgPath: "assets/icons/User_circle.svg",
                        keyboardType: TextInputType.emailAddress,
                        fontSize: diagonal * 0.0163,
                      ),
                      SizedBox(height: 20),
                      TxtFormFieldCustom(
                        hintText: "Celular",
                        svgPath: "assets/icons/Call.svg",
                        keyboardType: TextInputType.emailAddress,
                        fontSize: diagonal * 0.0163,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor,
                        ),
                        child: Text(
                          'Saltar',
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
                          'Registrarse',
                          style: TextStyle(
                            fontSize: diagonal * 0.0163,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
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
