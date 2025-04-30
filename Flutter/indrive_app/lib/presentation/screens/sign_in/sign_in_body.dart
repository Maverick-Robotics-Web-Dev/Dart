import 'package:flutter/material.dart';
import 'package:indrive_app/presentation/widgets/button_widget.dart';
import 'package:indrive_app/presentation/widgets/textformfield_widget.dart';
import 'package:lottie/lottie.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

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
            height: 200,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
          child: Column(
            children: [
              SizedBox(height: 220),
              Container(
                height: 442,
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
                        'assets/gifs_lottie/car_form.json',
                        width: 200,
                        repeat: true,
                      ),
                      TextFormFieldWidget(
                        text: 'Email',
                        icon: Icons.email_outlined,
                        margin: EdgeInsets.only(top: 52, right: 22, left: 22),
                        backdrop: Color.fromRGBO(224, 224, 224, 1),
                      ),
                      TextFormFieldWidget(
                        text: 'Password',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(top: 22, right: 22, left: 22),
                        backdrop: Color.fromRGBO(224, 224, 224, 1),
                      ),
                      ButtonWidget(
                        text: 'Sign In',
                        backdropColor: Colors.orange,
                        textColor: Colors.white,
                        fringe: EdgeInsets.only(
                          top: 22,
                          right: 40,
                          left: 40,
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
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(bottom: 114),
          child: Text(
            'Olvidaste tu contraseña?',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(bottom: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 1,
                color: Colors.white,
                margin: EdgeInsets.only(right: 10),
              ),
              Text('O', style: TextStyle(color: Colors.white, fontSize: 18)),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 1,
                color: Colors.white,
                margin: EdgeInsets.only(left: 10),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No tienes cuenta?',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'sign_up');
                },
                child: Text(
                  'Registrate',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
