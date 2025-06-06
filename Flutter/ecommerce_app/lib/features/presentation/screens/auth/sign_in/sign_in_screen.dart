import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_bloc.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_state.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:ecommerce_app/features/presentation/widgets/btn_elevated_custom.dart';
import 'package:ecommerce_app/features/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInBloc? _signInBloc;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _signInBloc?.diposeForm();
    // });
  }

  @override
  Widget build(BuildContext context) {
    _signInBloc = BlocProvider.of<SignInBloc>(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return Form(
                key: state.formKey,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/img/background2.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                      color: Colors.black54,
                      colorBlendMode: BlendMode.darken,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.84,
                      height: MediaQuery.of(context).size.height * 0.74,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.person, color: Colors.white, size: 125),
                          Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: TxtFormFieldCustom(
                              label: 'E-mail',
                              icon: Icons.email,
                              // errorText: snapshot.error?.toString(),
                              onChanged: (text) {
                                _signInBloc?.add(
                                  EmailChangedEvent(
                                    email: BlocFormItem(value: text),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: TxtFormFieldCustom(
                              label: 'Password',
                              icon: Icons.lock,
                              obscureText: true,
                              // errorText: snapshot.error?.toString(),
                              onChanged: (text) {
                                _signInBloc?.add(
                                  PasswordChangedEvent(
                                    password: BlocFormItem(value: text),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            margin: EdgeInsets.only(
                              top: 40,
                              right: 24,
                              left: 24,
                              bottom: 18,
                            ),
                            child: BtnElevatedCustom(
                              text: 'SIGN IN',
                              backgroundColor: Colors.lime,
                              onPressed: () {
                                _signInBloc?.add(SignInSubmitEvent());
                                // if (snapshot.hasData) {
                                //   _signInBloc?.signIn();
                                // } else {
                                //   Fluttertoast.showToast(
                                //     msg: 'Form invalid',
                                //     toastLength: Toast.LENGTH_LONG,
                                //   );
                                // }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 1.4,
                                  color: Colors.white,
                                  margin: EdgeInsets.only(right: 6),
                                ),
                                Text(
                                  'No tienes una cuenta?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 1.4,
                                  color: Colors.white,
                                  margin: EdgeInsets.only(left: 6),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            margin: EdgeInsets.only(
                              top: 24,
                              right: 24,
                              left: 24,
                            ),
                            child: BtnElevatedCustom(
                              text: 'SIGN UP',
                              onPressed: () {
                                Navigator.pushNamed(context, 'sign_up');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
