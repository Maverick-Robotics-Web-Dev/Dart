import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [_headerScreen(), _headerTexts(context)]),
        ),
      ),
    );
  }

  Widget _headerScreen() =>
      Image.asset('assets/images/login_img.jpg', fit: BoxFit.cover);

  Widget _headerTexts(BuildContext context) => Padding(
    padding: EdgeInsets.all(defaultPadding),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Peleteria Valamy',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: defaultPadding / 2),
        Text(
          // "Log in with your data that you intered during your registration.",
          'Inicia sesión con tus datos que ingresaste durante tu registro',
        ),
        SizedBox(height: defaultPadding),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TxtFormFieldCustom(
                svgPath: "assets/icons/Message.svg",
                hintText: "Email address",
                keyboardType: TextInputType.emailAddress,
              ),
              TxtFormFieldCustom(
                svgPath: "assets/icons/Lock.svg",
                hintText: "Password",
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
