import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_in/sign_in_response_model.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_bloc.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_state.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:ecommerce_app/features/presentation/widgets/btn_elevated_custom.dart';
import 'package:ecommerce_app/features/presentation/widgets/txt_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    _signInBloc = BlocProvider.of<SignInBloc>(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(width: double.infinity, child: _blocListener()),
      ),
    );
  }

  BlocListener<SignInBloc, SignInState> _blocListener() {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.failure is Failure) {
          Fluttertoast.showToast(
            msg: state.failure!.errorMessage,
            toastLength: Toast.LENGTH_LONG,
          );
        } else if (state.signInResponse is SignInResponseModel) {
          final SignInResponseModel signInResponse =
              state.signInResponse as SignInResponseModel;
          _signInBloc?.add(SignInFormResetEvent());
          _signInBloc?.add(
            SignInSaveUserSession(signInResponse: signInResponse),
          );
          Fluttertoast.showToast(
            msg: 'Login Exitoso',
            toastLength: Toast.LENGTH_LONG,
          );
        }
      },
      child: _blocBuilder(),
    );
  }

  BlocBuilder<SignInBloc, SignInState> _blocBuilder() {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        if (state.loadingData == 'Cargando') {
          return Stack(
            children: [
              _bodyPage(state, context),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return _bodyPage(state, context);
      },
    );
  }

  Form _bodyPage(SignInState state, BuildContext context) {
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
                _iconLabel(),
                _txtLabel(),
                _txtFormFieldEmail(state),
                _txtFormFieldPassword(state),
                _btnSignIn(context, state),
                _txtDontAccount(),
                _btnSignUp(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Icon _iconLabel() => Icon(Icons.person, color: Colors.white, size: 125);

  Text _txtLabel() {
    return Text(
      'SIGN IN',
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Padding _txtFormFieldEmail(SignInState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TxtFormFieldCustom(
        label: 'E-mail',
        icon: Icons.email,
        // errorText: snapshot.error?.toString(),
        validator: (value) {
          return state.email.error;
        },
        onChanged: (text) {
          _signInBloc?.add(EmailChangedEvent(email: BlocFormItem(value: text)));
        },
      ),
    );
  }

  Padding _txtFormFieldPassword(SignInState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: TxtFormFieldCustom(
        label: 'Password',
        icon: Icons.lock,
        obscureText: true,
        // errorText: snapshot.error?.toString(),
        validator: (value) {
          return state.password.error;
        },
        onChanged: (text) {
          _signInBloc?.add(
            PasswordChangedEvent(password: BlocFormItem(value: text)),
          );
        },
      ),
    );
  }

  Container _btnSignIn(BuildContext context, SignInState state) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: EdgeInsets.only(top: 40, right: 24, left: 24, bottom: 18),
      child: BtnElevatedCustom(
        text: 'SIGN IN',
        backgroundColor: Colors.lime,
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            _signInBloc?.add(SignInSubmitEvent());
          } else {
            Fluttertoast.showToast(
              msg: 'Form invalid',
              toastLength: Toast.LENGTH_LONG,
            );
          }
        },
      ),
    );
  }

  Padding _txtDontAccount() {
    return Padding(
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
    );
  }

  Container _btnSignUp(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: EdgeInsets.only(top: 24, right: 24, left: 24),
      child: BtnElevatedCustom(
        text: 'SIGN UP',
        onPressed: () {
          Navigator.pushNamed(context, 'sign_up');
        },
      ),
    );
  }
}
