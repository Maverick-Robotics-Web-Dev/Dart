import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignInTabletScreen extends StatefulWidget {
  final double height;
  final double width;
  final double maxWidth;
  final double maxHeight;
  final bool isKeyboardVisible;
  final TextTheme? textTheme;
  final GlobalKey<FormState>? formKey;

  const SignInTabletScreen({
    super.key,
    required this.height,
    required this.width,
    required this.maxWidth,
    required this.maxHeight,
    required this.isKeyboardVisible,
    this.textTheme,
    this.formKey,
  });

  @override
  State<SignInTabletScreen> createState() => _SignInTabletScreenState();
}

class _SignInTabletScreenState extends State<SignInTabletScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: widget.isKeyboardVisible ? widget.height : widget.maxHeight,
        width: widget.width,
        child: Row(
          children: [
            LeftSideContent(widget: widget),
            RightSideContent(widget: widget),
          ],
        ),
      ),
    );
  }
}

class RightSideContent extends StatelessWidget {
  final SignInTabletScreen widget;

  const RightSideContent({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 46),
      decoration: BoxDecoration(
        // color: Color(0xFFFAFAFA),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignInTitleTablet(),
          SizedBox(height: 26),
          SignInSubtitleTextTablet(),
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
    );
  }
}

class LeftSideContent extends StatelessWidget {
  final SignInTabletScreen widget;

  const LeftSideContent({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width * 0.6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          BackgroundImageTablet(),
          BackgroundColorOpacityTablet(),
          LogoLabelTablet(),
        ],
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
            fontSize: 16.6,
            letterSpacing: 1,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 16.6,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
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
        minimumSize: Size(double.infinity, 32),
        backgroundColor: primaryColor,
      ),
      child: Text(
        'Sign In',
        style: TextStyle(fontSize: 18, letterSpacing: 1, color: whiteColor),
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
            fontSize: 16.6,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key, required this.widget});

  final SignInTabletScreen widget;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TxtFormFieldCustom(
            svgPath: "assets/icons/Message.svg",
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 40),
          TxtFormFieldCustom(
            svgPath: "assets/icons/Lock.svg",
            hintText: "Password",
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

class SignInSubtitleTextTablet extends StatelessWidget {
  const SignInSubtitleTextTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      // "Log in with your data that you intered during your registration.",
      'Inicia sesión con tus datos que ingresaste durante tu registro',
      textAlign: TextAlign.center,
      style: TextStyle(color: secondaryColor, fontSize: 16.6, letterSpacing: 1),
    );
  }
}

class SignInTitleTablet extends StatelessWidget {
  const SignInTitleTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '¡Bienvenido de Nuevo!',
      textAlign: TextAlign.center,
      style: TextStyle(color: primaryColor, fontSize: 34, letterSpacing: 1),
    );
  }
}

class LogoLabelTablet extends StatelessWidget {
  const LogoLabelTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo_valamy_blanco.png',
          width: 260,
          height: 260,
        ),
        Text(
          'Peleteria Valamy',
          style: TextStyle(color: Colors.white, fontSize: 48, letterSpacing: 1),
        ),
        Text(
          'Exclusividad y Sofisticación',
          style: TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 1),
        ),
      ],
    );
  }
}

class BackgroundColorOpacityTablet extends StatelessWidget {
  const BackgroundColorOpacityTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Color.fromRGBO(13, 71, 161, 0.7)),
    );
  }
}

class BackgroundImageTablet extends StatelessWidget {
  const BackgroundImageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sign_in_image.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
