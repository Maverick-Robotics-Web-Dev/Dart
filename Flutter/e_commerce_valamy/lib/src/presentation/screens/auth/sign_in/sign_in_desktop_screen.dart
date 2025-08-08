import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignInDesktopScreen extends StatefulWidget {
  final double height;
  final double width;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignInDesktopScreen({
    super.key,
    required this.height,
    required this.width,
    this.textTheme,
    this.formKey,
  });

  @override
  State<SignInDesktopScreen> createState() => _SignInDesktopScreenState();
}

class _SignInDesktopScreenState extends State<SignInDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: widget.height,
        width: widget.width,
        // color: Colors.amber,
        child: Stack(
          children: [
            BackgroundImageDesktop(widget: widget),
            BackgroundColorOpacityDesktop(),
            Row(
              children: [LeftSideContent(), RightSideContent(widget: widget)],
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundImageDesktop extends StatelessWidget {
  final SignInDesktopScreen widget;

  const BackgroundImageDesktop({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sign_in_image_mobile.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class BackgroundColorOpacityDesktop extends StatelessWidget {
  const BackgroundColorOpacityDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: transparentBlue),
    );
  }
}

class LeftSideContent extends StatelessWidget {
  const LeftSideContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(alignment: Alignment.center, children: [LogoLabelDesktop()]),
    );
  }
}

class LogoLabelDesktop extends StatelessWidget {
  const LogoLabelDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          // color: whiteColor,
          decoration: BoxDecoration(
            color: whiteColor,
            image: DecorationImage(
              image: AssetImage('assets/images/sign_in_photo_2.png'),
              // fit: BoxFit.fill,
            ),
          ),
        ),
        // Image.asset(
        //   'assets/images/logo_valamy_azul.png',
        //   width: 260,
        //   height: 260,
        // ),
        // Text(
        //   'Peleteria Valamy',
        //   style: TextStyle(color: primaryColor, fontSize: 48, letterSpacing: 1),
        // ),
        // Text(
        //   'Exclusividad y Sofisticación',
        //   style: TextStyle(color: primaryColor, fontSize: 22, letterSpacing: 1),
        // ),
      ],
    );
  }
}

class RightSideContent extends StatelessWidget {
  final SignInDesktopScreen widget;

  const RightSideContent({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 40, horizontal: 120),
        padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          // color: Color(0xFFFAFAFA),
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInTitleDesktop(),
            SizedBox(height: 26),
            SignInSubtitleTextDesktop(),
            SizedBox(height: 40),
            SignInForm(widget: widget),
            SizedBox(height: 20),
            ForgotPassTextButtonTablet(),
            SizedBox(
              height: widget.height > 700 ? (widget.height * 0.1) : (h_16),
            ),
            SignInButtonTablet(),
            SizedBox(height: 26),
            DontAccountLabelTablet(),
          ],
        ),
      ),
    );
  }
}

class SignInTitleDesktop extends StatelessWidget {
  const SignInTitleDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '¡Bienvenido de Nuevo!',
      textAlign: TextAlign.center,
      style: TextStyle(color: primaryColor, fontSize: 28, letterSpacing: 1),
    );
  }
}

class SignInSubtitleTextDesktop extends StatelessWidget {
  const SignInSubtitleTextDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      // "Log in with your data that you intered during your registration.",
      'Inicia sesión con tus datos que ingresaste durante tu registro',
      textAlign: TextAlign.center,
      style: TextStyle(color: secondaryColor, fontSize: 14, letterSpacing: 1),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key, required this.widget});

  final SignInDesktopScreen widget;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TxtFormFieldCustom(
            svgPath: "assets/icons/Message.svg",
            hintText: "Email",
            fontSize: 14,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 40),
          TxtFormFieldCustom(
            svgPath: "assets/icons/Lock.svg",
            hintText: "Password",
            fontSize: 14,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

class ForgotPassTextButtonTablet extends StatelessWidget {
  const ForgotPassTextButtonTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: TextButton(
        onPressed: () {},
        child: Text(
          '¿Olvidaste tu contraseña?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: secondaryColor,
            fontSize: 14.6,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

class SignInButtonTablet extends StatelessWidget {
  const SignInButtonTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 56),
        backgroundColor: primaryColor,
      ),
      child: Text(
        'Sign In',
        style: TextStyle(fontSize: 14, letterSpacing: 1, color: whiteColor),
      ),
    );
  }
}

class DontAccountLabelTablet extends StatelessWidget {
  const DontAccountLabelTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes una cuenta?',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 14,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}
