import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignUpSetupScreen extends StatefulWidget {
  const SignUpSetupScreen({super.key});

  @override
  State<SignUpSetupScreen> createState() => _SignUpSetupScreenState();
}

class _SignUpSetupScreenState extends State<SignUpSetupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [_bodyScreen(context, textTheme, height)]),
        ),
      ),
    );
  }

  Widget _bodyScreen(
    BuildContext context,
    TextTheme textTheme,
    double height,
  ) => Padding(
    padding: EdgeInsets.all(h_16),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TxtFormFieldCustom(
                hintText: "Nombre",
                svgPath: "assets/icons/Profile.svg",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: h_16),
              TxtFormFieldCustom(
                hintText: "Apellido",
                svgPath: "assets/icons/User_circle.svg",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: h_16),
              TxtFormFieldCustom(
                hintText: "Celular",
                svgPath: "assets/icons/Call.svg",
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('hola')),
            Text('Hola'),
          ],
        ),
      ],
    ),
  );
}
