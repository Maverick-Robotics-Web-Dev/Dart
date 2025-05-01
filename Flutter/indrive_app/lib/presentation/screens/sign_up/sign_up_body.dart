import 'package:flutter/material.dart';
import 'package:indrive_app/bloc/sign_in/sign_in_bloc.dart';
import 'package:indrive_app/bloc/sign_in/sign_in_blocevent.dart';
import 'package:indrive_app/presentation/widgets/button_widget.dart';
import 'package:indrive_app/presentation/widgets/textformfield_widget.dart';
import 'package:lottie/lottie.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
        ),
        Opacity(
          opacity: 0.2,
          child: Image.asset(
            'assets/img/city_black.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          child: Image.asset(
            'assets/img/city_background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 140,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
          child: Column(
            children: [
              SizedBox(height: 120),
              Container(
                height: MediaQuery.of(context).size.height * 0.76,
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(128, 128, 128, 1),
                        blurRadius: 8,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Lottie.asset(
                        'assets/gifs_lottie/sign_in.json',
                        width: 180,
                        repeat: true,
                      ),
                      TextFormFieldWidget(
                        text: 'Nombre',
                        icon: Icons.person_outline,
                        margin: EdgeInsets.only(right: 22, left: 22),
                        backdrop: Color.fromRGBO(224, 224, 224, 1),
                        onChange: (text) {},
                      ),
                      TextFormFieldWidget(
                        text: 'Apellido',
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.only(top: 22, right: 22, left: 22),
                        backdrop: Color.fromRGBO(224, 224, 224, 1),
                        onChange: (text) {},
                      ),
                      TextFormFieldWidget(
                        text: 'Email',
                        icon: Icons.email_outlined,
                        margin: EdgeInsets.only(top: 22, right: 22, left: 22),
                        backdrop: Color.fromRGBO(224, 224, 224, 1),
                        onChange: (text) {},
                      ),
                      TextFormFieldWidget(
                        text: 'Telefono',
                        icon: Icons.phone_android_outlined,
                        margin: EdgeInsets.only(top: 22, right: 22, left: 22),
                        backdrop: Color.fromRGBO(224, 224, 224, 1),
                        onChange: (text) {},
                      ),
                      TextFormFieldWidget(
                        text: 'Contraseña',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(top: 22, right: 22, left: 22),
                        backdrop: Color.fromRGBO(224, 224, 224, 1),
                        onChange: (text) {},
                      ),
                      TextFormFieldWidget(
                        text: 'Confirmar Contraseña',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(top: 22, right: 22, left: 22),
                        backdrop: Color.fromRGBO(224, 224, 224, 1),
                        onChange: (text) {},
                      ),
                      ButtonWidget(
                        text: 'Sign Up',
                        onPush: () {},
                        backdropColor: Colors.orange,
                        textColor: Colors.white,
                        fringe: EdgeInsets.only(
                          top: 22,
                          right: 22,
                          left: 22,
                          bottom: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
