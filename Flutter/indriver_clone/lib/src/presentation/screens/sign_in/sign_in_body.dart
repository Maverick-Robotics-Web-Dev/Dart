import 'package:flutter/material.dart';
import 'package:indriver_clone/src/presentation/widgets/custom_button.dart';
import 'package:indriver_clone/src/presentation/widgets/custom_textformfield.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(12, 38, 145, 1),
                Color.fromRGBO(34, 156, 249, 1),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _signInRotated(),
              SizedBox(height: 60),
              _signUpRotated(),
              SizedBox(height: 100),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 60, bottom: 40),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(14, 29, 166, 1),
                Color.fromRGBO(30, 112, 227, 1),
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              bottomLeft: Radius.circular(36),
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(right: 26, left: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'back...',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/img/car_white.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextFormField(
                  text: 'Email',
                  icon: Icons.email_outlined,
                  margin: EdgeInsets.only(top: 52, right: 22, left: 22),
                ),
                CustomTextFormField(
                  text: 'Password',
                  icon: Icons.lock_outline,
                  margin: EdgeInsets.only(top: 34, right: 22, left: 22),
                ),
                CustomButton(
                  text: 'Sign In',
                  fringe: EdgeInsets.only(
                    top: 80,
                    right: 40,
                    left: 40,
                    bottom: 22,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 26,
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.only(right: 6),
                    ),
                    Text(
                      'O',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Container(
                      width: 26,
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 6),
                    ),
                  ],
                ),
                SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No tienes cuenta?',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Registrate',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 42),
              ],
            ),
          ),
        ),
      ],
    );
  }

  RotatedBox _signUpRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

  RotatedBox _signInRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Sign In',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
