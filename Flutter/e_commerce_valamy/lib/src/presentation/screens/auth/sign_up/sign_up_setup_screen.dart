import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          child: _bodyScreen(context, textTheme, height),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: inputBackgroundColor,
                    foregroundColor: primaryColor,
                    side: BorderSide(color: borderColor),
                  ),
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
      children: [
        // Stack(
        //   children: [
        //     CircleAvatar(maxRadius: 66),
        //     Positioned(
        //       height: 44,
        //       right: -6,
        //       bottom: 0,
        //       child: ElevatedButton(
        //         onPressed: () {},
        //         style: ElevatedButton.styleFrom(
        //           shape: CircleBorder(),
        //           padding: EdgeInsets.zero,
        //         ),
        //         child: SvgPicture.asset(
        //           "assets/icons/Camera-Bold.svg",
        //           height: 26,
        //           fit: BoxFit.cover,
        //           colorFilter: ColorFilter.mode(whiteColor, BlendMode.srcIn),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        CircleAvatar(
          maxRadius: 66,
          backgroundImage: AssetImage("assets/images/scarlett_johansson.jpg"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {},
            child: Text("Upload Image", style: TextStyle(fontSize: h_16)),
          ),
        ),
        SizedBox(height: 8),
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
      ],
    ),
  );
}
