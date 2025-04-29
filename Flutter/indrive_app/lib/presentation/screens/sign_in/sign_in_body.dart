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
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     _signInRotated(),
          //     SizedBox(height: 60),
          //     _signUpRotated(context),
          //     SizedBox(height: 100),
          //   ],
          // ),
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
            height: 280,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              SizedBox(height: 280),
              Container(
                height: 442,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 1,
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
                    ),
                    TextFormFieldWidget(
                      text: 'Password',
                      icon: Icons.lock_outline,
                      margin: EdgeInsets.only(top: 22, right: 22, left: 22),
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
            ],
          ),
        ),
        // Container(
        //   margin: EdgeInsets.only(left: 60, bottom: 40),
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topRight,
        //       end: Alignment.bottomLeft,
        //       colors: [
        //         Color.fromRGBO(14, 29, 166, 1),
        //         Color.fromRGBO(30, 112, 227, 1),
        //       ],
        //     ),
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(36),
        //       bottomLeft: Radius.circular(36),
        //     ),
        //   ),
        //   child: Container(
        //     margin: EdgeInsets.only(right: 26, left: 26),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         SizedBox(height: 80),
        //         Text(
        //           'Welcome',
        //           style: TextStyle(
        //             fontSize: 30,
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         Text(
        //           'back...',
        //           style: TextStyle(
        //             fontSize: 30,
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         Text(
        //           'Sign In',
        //           style: TextStyle(
        //             fontSize: 24,
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Container(
        //               width: 26,
        //               height: 1,
        //               color: Colors.white,
        //               margin: EdgeInsets.only(right: 6),
        //             ),
        //             Text(
        //               'O',
        //               style: TextStyle(color: Colors.white, fontSize: 18),
        //             ),
        //             Container(
        //               width: 26,
        //               height: 1,
        //               color: Colors.white,
        //               margin: EdgeInsets.only(left: 6),
        //             ),
        //           ],
        //         ),
        //         SizedBox(height: 22),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               'No tienes cuenta?',
        //               style: TextStyle(color: Colors.white),
        //             ),
        //             SizedBox(width: 12),
        //             GestureDetector(
        //               onTap: () {
        //                 Navigator.pushNamed(context, 'sign_up');
        //               },
        //               child: Text(
        //                 'Registrate',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         SizedBox(height: 42),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
