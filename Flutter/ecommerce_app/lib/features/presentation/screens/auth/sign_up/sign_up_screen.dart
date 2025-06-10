import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_up/sign_up_response_model.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_up/sign_up_bloc.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_up/sign_up_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_up/sign_up_state.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
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
  SignUpBloc? _signUpBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _signUpBloc = BlocProvider.of<SignUpBloc>(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocListener<SignUpBloc, SignUpState>(
            listener: (context, state) {
              if (state.failure is Failure) {
                Fluttertoast.showToast(
                  msg: state.failure!.errorMessage,
                  toastLength: Toast.LENGTH_LONG,
                );
              } else if (state.signUpResponse is SignUpResponseModel) {
                _signUpBloc?.add(SignUpFormResetEvent());
                Fluttertoast.showToast(
                  msg: state.signUpResponse!.msg,
                  toastLength: Toast.LENGTH_LONG,
                );
              }
            },
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                return Form(
                  key: state.formKey,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _imageBackground(context),
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
                              Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 100,
                              ),
                              Text(
                                'SIGN UP',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 24,
                                  right: 24,
                                  left: 24,
                                ),
                                child: TxtFormFieldCustom(
                                  label: 'Nombre',
                                  icon: Icons.person,
                                  validator: (value) => state.name.error,
                                  onChanged: (text) {
                                    _signUpBloc?.add(
                                      NameChangedEvent(
                                        name: BlocFormItem(value: text),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 12,
                                  right: 24,
                                  left: 24,
                                ),
                                child: TxtFormFieldCustom(
                                  label: 'Apellido',
                                  icon: Icons.person,
                                  validator: (value) => state.lastname.error,
                                  onChanged: (text) {
                                    _signUpBloc?.add(
                                      LastNameChangedEvent(
                                        lastname: BlocFormItem(value: text),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 12,
                                  right: 24,
                                  left: 24,
                                ),
                                child: TxtFormFieldCustom(
                                  label: 'E-mail',
                                  icon: Icons.email,
                                  validator: (value) => state.email.error,
                                  onChanged: (text) {
                                    _signUpBloc?.add(
                                      EmailChangedEvent(
                                        email: BlocFormItem(value: text),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 12,
                                  right: 24,
                                  left: 24,
                                ),
                                child: TxtFormFieldCustom(
                                  label: 'Telefono',
                                  icon: Icons.smartphone,
                                  validator: (value) => state.phone.error,
                                  onChanged: (text) {
                                    _signUpBloc?.add(
                                      PhoneChangedEvent(
                                        phone: BlocFormItem(value: text),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 12,
                                  right: 24,
                                  left: 24,
                                ),
                                child: TxtFormFieldCustom(
                                  label: 'Contraseña',
                                  icon: Icons.lock,
                                  obscureText: true,
                                  validator: (value) => state.password.error,
                                  onChanged: (text) {
                                    _signUpBloc?.add(
                                      PasswordChangedEvent(
                                        password: BlocFormItem(value: text),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 12,
                                  right: 24,
                                  left: 24,
                                ),
                                child: TxtFormFieldCustom(
                                  label: 'Confirmar Contraseña',
                                  icon: Icons.lock,
                                  obscureText: true,
                                  validator:
                                      (value) => state.confirmPassword.error,
                                  onChanged: (text) {
                                    _signUpBloc?.add(
                                      ConfirmPasswordChangedEvent(
                                        confirmPassword: BlocFormItem(
                                          value: text,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                margin: EdgeInsets.only(
                                  top: 60,
                                  right: 24,
                                  left: 24,
                                ),
                                child: BtnElevatedCustom(
                                  text: 'REGISTRARSE',
                                  onPressed: () {
                                    if (state.formKey!.currentState!
                                        .validate()) {
                                      _signUpBloc?.add(SignUpSubmitEvent());
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: 'Form invalid',
                                        toastLength: Toast.LENGTH_LONG,
                                      );
                                    }
                                  },
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background8.jpg',
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      color: Colors.black54,
      colorBlendMode: BlendMode.darken,
    );
  }
}
