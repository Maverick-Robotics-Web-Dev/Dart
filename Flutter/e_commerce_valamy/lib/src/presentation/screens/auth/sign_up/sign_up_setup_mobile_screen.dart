import 'dart:math';

import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/text_form_field_custom.dart';
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
                ProfileTextBox(diagonal: diagonal),
                SizedBox(height: 40),
                ImageUserBox(maxHeight: widget.maxHeight),
                SizedBox(height: 8),
                UploadTextButtomBox(diagonal: diagonal),
                SizedBox(height: 28),
                FormBox(formKey: widget.formKey, diagonal: diagonal),
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

class ProfileTextBox extends StatelessWidget {
  const ProfileTextBox({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Perfil',
      style: TextStyle(
        color: whiteColor,
        fontSize: diagonal * 0.0215,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
      ),
    );
  }
}

class ImageUserBox extends StatelessWidget {
  final double maxHeight;

  const ImageUserBox({super.key, required this.maxHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxHeight * 0.17386,
      width: maxHeight * 0.17386,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: whiteColor, shape: BoxShape.circle),
      child: CircleAvatar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(maxHeight * 0.16),
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
    );
  }
}

class UploadTextButtomBox extends StatelessWidget {
  const UploadTextButtomBox({super.key, required this.diagonal});

  final double diagonal;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Subir Imagen",
        style: TextStyle(
          color: whiteColor,
          fontSize: diagonal * 0.017,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class FormBox extends StatelessWidget {
  final double diagonal;
  final GlobalKey<FormState>? formKey;

  const FormBox({super.key, required this.diagonal, this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormFieldCustom(
            hintText: "Nombre",
            svgPath: "assets/icons/Profile.svg",
            keyboardType: TextInputType.emailAddress,
            fontSize: diagonal * 0.0163,
          ),
          SizedBox(height: 20),
          TextFormFieldCustom(
            hintText: "Apellido",
            svgPath: "assets/icons/User_circle.svg",
            keyboardType: TextInputType.emailAddress,
            fontSize: diagonal * 0.0163,
          ),
          SizedBox(height: 20),
          TextFormFieldCustom(
            hintText: "Celular",
            svgPath: "assets/icons/Call.svg",
            keyboardType: TextInputType.emailAddress,
            fontSize: diagonal * 0.0163,
          ),
        ],
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
              style: TextStyle(fontSize: diagonal * 0.0163, letterSpacing: 1),
            ),
          ),
        ),
      ],
    );
  }
}
