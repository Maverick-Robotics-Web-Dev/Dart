import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
        appBar: AppBar(
          title: Text('Perfil', style: TextStyle(color: primaryColor)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
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
        CircleAvatar(maxRadius: 80),
        // Container(
        //   height: 100,
        //   width: 100,
        //   decoration: const BoxDecoration(
        //     shape: BoxShape.circle,
        //     color: Color(0xFFE486DD),
        //   ),
        //   // child: Transform.scale(scale: 0.55, child: Image.asset(Assets.dash)),
        // ),
        SizedBox(height: 24),
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

        // SizedBox(height: height > 700 ? height * 0.6 : h_16),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Saltar',
                  style: TextStyle(fontSize: 16, letterSpacing: 1),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 16, letterSpacing: 1),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
