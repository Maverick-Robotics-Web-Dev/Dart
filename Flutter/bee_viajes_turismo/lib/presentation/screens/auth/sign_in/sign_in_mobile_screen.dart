import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/config/routes/routes.dart';
import 'package:bee_viajes_turismo/infrastructure/inputs/inputs.dart';
import 'package:bee_viajes_turismo/presentation/blocs/blocs.dart';
import 'package:bee_viajes_turismo/presentation/blocs/sign_in/sign_in_event.dart';
import 'package:bee_viajes_turismo/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInMobileScreen extends StatelessWidget {
  final ThemeData appTheme;
  final GlobalKey<FormState>? formKey;

  const SignInMobileScreen({super.key, required this.appTheme, this.formKey});

  @override
  Widget build(BuildContext context) {
    final SignInBloc bloc = context.read<SignInBloc>();
    final SignInBloc blocState = context.watch<SignInBloc>();

    return Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: SpacingTokens.md),
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
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          labelText: 'Email',
                          hintText: 'Email',
                          svgPath: 'assets/icons/Message.svg',
                          errorText: blocState.state.email.errorMessage,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            bloc.add(
                              EmailChange(email: Email.dirty(value: value)),
                            );
                          },
                        ),
                        SizedBox(height: SpacingTokens.md),
                        CustomTextFormField(
                          labelText: 'Password',
                          hintText: 'Password',
                          svgPath: 'assets/icons/Lock.svg',
                          obscureText: true,
                          errorText: blocState.state.password.errorMessage,
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
                          child: Text(
                            'Iniciar Sesión',
                            style: TextStyle(fontSize: FontTokens.md),
                          ),
                          onPressed: () {
                            // context.pushNamed(mainScreenRoute);
                            bloc.add(OnFormSubmit());
                          },
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
