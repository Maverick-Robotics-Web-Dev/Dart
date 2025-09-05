import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignUpSetupTabletScreen extends StatefulWidget {
  final double maxWidth;
  final double maxHeight;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignUpSetupTabletScreen({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
    this.textTheme,
    this.formKey,
  });

  @override
  State<SignUpSetupTabletScreen> createState() =>
      _SignUpSetupTabletScreenState();
}

class _SignUpSetupTabletScreenState extends State<SignUpSetupTabletScreen> {
  @override
  Widget build(BuildContext context) {
    final num sumsqsides = pow(widget.maxHeight, 2) + pow(widget.maxWidth, 2);
    final double diagonal = sqrt(sumsqsides);
    print('Diagonal: ${diagonal * 0.0176}');

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: widget.maxHeight * 0.10,
              child: Text(
                'Perfil',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: diagonal * 0.02432,
                  letterSpacing: 1,
                ),
              ),
            ),
            SizedBox(
              height: widget.maxHeight * 0.90,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: widget.maxWidth * 0.5,
                    height: widget.maxHeight * 0.9,
                    child: SizedBox(
                      height: widget.maxHeight * 0.6,
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: ClipOval(
                          child: FadeInImage(
                            placeholder: AssetImage(
                              'assets/images/no_image.png',
                            ),
                            image: AssetImage(
                              'assets/images/scarlett_johansson.jpg',
                            ),
                            fit: BoxFit.cover,
                            fadeInDuration: Duration(seconds: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: whiteColor,
                    width: widget.maxWidth * 0.5,
                    height: widget.maxHeight * 0.9,
                    child: Container(
                      margin: EdgeInsets.all(40),
                      padding: EdgeInsets.symmetric(
                        vertical: 46,
                        horizontal: 26,
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
