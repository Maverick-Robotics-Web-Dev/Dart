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

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Row(
          children: [
            LeftBox(
              maxWidth: widget.maxWidth,
              maxHeight: widget.maxHeight,
              diagonal: diagonal,
            ),
            RightBox(
              maxWidth: widget.maxWidth,
              maxHeight: widget.maxHeight,
              diagonal: diagonal,
              formKey: widget.formKey,
            ),
          ],
        ),
      ),
    );
  }
}

class LeftBox extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final double diagonal;

  const LeftBox({
    super.key,
    required this.diagonal,
    required this.maxWidth,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth * 0.6,
      height: maxHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: maxHeight * 0.6,
            width: maxHeight * 0.6,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: whiteColor,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(maxHeight * 0.6),
                child: FadeInImage(
                  height: maxHeight,
                  placeholder: AssetImage('assets/images/no_image.png'),
                  image: AssetImage('assets/images/scarlett_johansson.jpg'),
                  // image: NetworkImage(
                  //   'https://media.gq.com.mx/photos/5e220ec2ffa8c7000803441e/1:1/w_2071,h_2071,c_limit/40-datos-curiosos-para-descubrir-a-scarlett-johansson.jpg',
                  // ),
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(seconds: 1),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: Text(
              'Subir Imagen',
              style: TextStyle(
                color: whiteColor,
                fontSize: diagonal * 0.0203,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RightBox extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final double diagonal;
  final GlobalKey<FormState>? formKey;

  const RightBox({
    super.key,
    required this.diagonal,
    required this.maxWidth,
    required this.maxHeight,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth * 0.4,
      height: maxHeight,
      child: Container(
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.symmetric(vertical: 46, horizontal: 26),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Perfil',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryColor,
                // color: whiteColor,
                fontSize: diagonal * 0.023,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 40),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TxtFormFieldCustom(
                    svgPath: "assets/icons/Profile.svg",
                    hintText: "Nombre",
                    keyboardType: TextInputType.emailAddress,
                    fontSize: diagonal * 0.01122,
                  ),
                  SizedBox(height: 40),
                  TxtFormFieldCustom(
                    svgPath: "assets/icons/User_circle.svg",
                    hintText: "Apellido",
                    obscureText: true,
                    fontSize: diagonal * 0.01122,
                  ),
                  SizedBox(height: 40),
                  TxtFormFieldCustom(
                    svgPath: "assets/icons/Call.svg",
                    hintText: "Celular",
                    obscureText: true,
                    fontSize: diagonal * 0.01122,
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
                      backgroundColor: inputBackgroundColor,
                      side: BorderSide(color: primaryColor),
                    ),
                    child: Text(
                      'Saltar',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: diagonal * 0.01122,
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
                        fontSize: diagonal * 0.01122,
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
    );
  }
}
