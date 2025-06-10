import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_up/sign_up_bloc.dart';
import 'package:ecommerce_app/features/presentation/widgets/btn_elevated_custom.dart';
import 'package:ecommerce_app/features/presentation/widgets/btn_icon_custom.dart';
import 'package:ecommerce_app/features/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpBloc? _signUpBlocCubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _signUpBlocCubit?.diposeForm();
    });
  }

  @override
  Widget build(BuildContext context) {
    _signUpBlocCubit = BlocProvider.of<SignUpBloc>(context, listen: false);
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
                        child: StreamBuilder(
                          stream: _signUpBlocCubit?.nameStream,
                          builder: (context, snapshot) {
                            return TxtFormFieldCustom(
                              label: 'Nombre',
                              errorText: snapshot.error?.toString(),
                              icon: Icons.person,
                              onChanged: (text) {
                                _signUpBlocCubit?.changeName(text);
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, right: 24, left: 24),
                        child: StreamBuilder(
                          stream: _signUpBlocCubit?.lastnameStream,
                          builder: (context, snapshot) {
                            return TxtFormFieldCustom(
                              label: 'Apellido',
                              errorText: snapshot.error?.toString(),
                              icon: Icons.person,
                              onChanged: (text) {
                                _signUpBlocCubit?.changeLastname(text);
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, right: 24, left: 24),
                        child: StreamBuilder(
                          stream: _signUpBlocCubit?.emailStream,
                          builder: (context, snapshot) {
                            return TxtFormFieldCustom(
                              label: 'E-mail',
                              errorText: snapshot.error?.toString(),
                              icon: Icons.email,
                              onChanged: (text) {
                                _signUpBlocCubit?.changeEmail(text);
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, right: 24, left: 24),
                        child: StreamBuilder(
                          stream: _signUpBlocCubit?.phoneStream,
                          builder: (context, snapshot) {
                            return TxtFormFieldCustom(
                              label: 'Telefono',
                              errorText: snapshot.error?.toString(),
                              icon: Icons.smartphone,
                              onChanged: (text) {
                                _signUpBlocCubit?.changePhone(text);
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, right: 24, left: 24),
                        child: StreamBuilder(
                          stream: _signUpBlocCubit?.passwordStream,
                          builder: (context, snapshot) {
                            return TxtFormFieldCustom(
                              label: 'Contraseña',
                              errorText: snapshot.error?.toString(),
                              icon: Icons.lock,
                              obscureText: true,
                              onChanged: (text) {
                                _signUpBlocCubit?.changePassword(text);
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, right: 24, left: 24),
                        child: StreamBuilder(
                          stream: _signUpBlocCubit?.confirmPasswordStream,
                          builder: (context, snapshot) {
                            return TxtFormFieldCustom(
                              label: 'Confirmar Contraseña',
                              errorText: snapshot.error?.toString(),
                              icon: Icons.lock,
                              obscureText: true,
                              onChanged: (text) {
                                _signUpBlocCubit?.changeConfirmPassword(text);
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        margin: EdgeInsets.only(top: 60, right: 24, left: 24),
                        child: StreamBuilder(
                          stream: _signUpBlocCubit?.validateForm,
                          builder: (context, snapshot) {
                            return BtnElevatedCustom(
                              text: 'REGISTRARSE',
                              onPressed: () {
                                if (snapshot.hasData) {
                                  _signUpBlocCubit?.signUp();
                                } else {
                                  Fluttertoast.showToast(
                                    msg: 'Form invalid',
                                    toastLength: Toast.LENGTH_LONG,
                                  );
                                }
                              },
                              backgroundColor: Colors.lime,
                              color: Colors.black,
                            );
                          },
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
