import 'package:ecommerce_app/features/presentation/widgets/btn_elevated_custom.dart';
import 'package:ecommerce_app/features/presentation/widgets/btn_icon_custom.dart';
import 'package:ecommerce_app/features/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/img/background8.jpg',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                color: Colors.black54,
                colorBlendMode: BlendMode.darken,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 16, left: 20),
                child: BtnIconCustom(
                  icon: Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.84,
                height: MediaQuery.of(context).size.height * 0.74,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Icon(Icons.person, color: Colors.white, size: 100),
                      Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 24, right: 24, left: 24),
                        child: TxtFormFieldCustom(
                          label: 'Nombre',
                          icon: Icons.person,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, right: 24, left: 24),
                        child: TxtFormFieldCustom(
                          label: 'Apellido',
                          icon: Icons.person,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, right: 24, left: 24),
                        child: TxtFormFieldCustom(
                          label: 'E-mail',
                          icon: Icons.email,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, right: 24, left: 24),
                        child: TxtFormFieldCustom(
                          label: 'Telefono',
                          icon: Icons.smartphone,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, right: 24, left: 24),
                        child: TxtFormFieldCustom(
                          label: 'Contraseña',
                          icon: Icons.lock,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, right: 24, left: 24),
                        child: TxtFormFieldCustom(
                          label: 'Confirmar Contraseña',
                          icon: Icons.lock,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        margin: EdgeInsets.only(top: 60, right: 24, left: 24),
                        child: BtnElevatedCustom(
                          text: 'REGISTRARSE',
                          onPressed: () {},
                          backgroundColor: Colors.lime,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
