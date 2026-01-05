import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/auth/auth_event.dart';
import '../../../blocs/auth/auth_state.dart';
import '../../../blocs/sign_in/sign_in_bloc.dart';
import '../../../blocs/sign_in/sign_in_event.dart';
import '../../../blocs/sign_in/sign_in_state.dart';
import '../../../widgets/inputs/custom_text_form_field.dart';

class SignInMobileScreen extends StatelessWidget {
  final ThemeData appTheme;
  final GlobalKey<FormState>? formKey;

  const SignInMobileScreen({super.key, required this.appTheme, this.formKey});

  @override
  Widget build(BuildContext context) {
    final SignInFormBloc bloc = context.read<SignInFormBloc>();
    final AuthBloc authBloc = context.read<AuthBloc>();
    // final SignInFormBloc blocState = context.watch<SignInFormBloc>();

    return MultiBlocListener(
      listeners: [
        BlocListener<SignInFormBloc, SignInFormState>(
          listener: (context, state) {
            if (state.isValid) {
              authBloc.add(
                SignIn(
                  email: state.email.value,
                  password: state.password.value,
                ),
              );
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              authBloc.add(SignOut());
              bloc.add(OnFormReset());
            }
          },
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(SpacingTokens.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/img/logo_valamy_bl.webp', height: 50),
                    SizedBox(width: SpacingTokens.lg),
                    Text(
                      'BEE VIAJES Y TURISMO',
                      style: appTheme.textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingTokens.md,
                ),
                child: Image.asset('assets/img/sign_in_photo_blue.webp'),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingTokens.md,
                  vertical: SpacingTokens.lg,
                ),
                child: Column(
                  children: [
                    Text(
                      '¡Bienvenido de Nuevo!',
                      style: appTheme.textTheme.headlineLarge,
                    ),
                    SizedBox(height: SpacingTokens.sm),
                    Text(
                      'Inicia sesión con los datos que te registraste',
                      style: appTheme.textTheme.titleMedium,
                    ),
                    SizedBox(height: SpacingTokens.lg),
                    BlocBuilder<SignInFormBloc, SignInFormState>(
                      builder: (context, state) {
                        return Form(
                          child: Column(
                            children: [
                              CustomTextFormField(
                                labelText: 'Email',
                                hintText: 'Email',
                                svgPath: 'assets/icons/Message.svg',
                                errorText: state.isFormPosted
                                    ? state.email.errorMessage
                                    : null,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  bloc.add(
                                    EmailChange(
                                      email: Email.dirty(value: value),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: SpacingTokens.md),
                              CustomTextFormField(
                                labelText: 'Password',
                                hintText: 'Password',
                                svgPath: 'assets/icons/Lock.svg',
                                obscureText: true,
                                errorText: state.isFormPosted
                                    ? state.password.errorMessage
                                    : null,
                                onChanged: (value) {
                                  bloc.add(
                                    PasswordChange(
                                      password: Password.dirty(value: value),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: SpacingTokens.sm),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  '¿Olvidaste tu contraseña?',
                                  style: appTheme.textTheme.titleMedium,
                                ),
                              ),
                              SizedBox(height: SpacingTokens.xxl),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 60),
                                ),
                                onPressed: state.isPosting
                                    ? () {
                                        bloc.add(OnFormSubmit());
                                      }
                                    : null,
                                child: Text(
                                  'Iniciar Sesión',
                                  style: TextStyle(fontSize: FontTokens.md),
                                ),
                              ),
                              SizedBox(height: SpacingTokens.xs),
                              TextButton(
                                child: Text(
                                  '¿No tienes una cuenta? Registrate',
                                  style: appTheme.textTheme.titleMedium,
                                ),
                                onPressed: () {
                                  context.pushNamed(signUpScreenRoute);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
