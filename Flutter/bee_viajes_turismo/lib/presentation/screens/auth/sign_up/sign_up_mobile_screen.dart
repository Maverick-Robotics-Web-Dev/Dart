import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/config/routes/routes.dart';
import 'package:bee_viajes_turismo/presentation/blocs/blocs.dart';
import 'package:bee_viajes_turismo/presentation/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpMobileScreen extends StatelessWidget {
  final ThemeData appTheme;
  final GlobalKey<FormState>? formKey;

  const SignUpMobileScreen({super.key, required this.appTheme, this.formKey});

  @override
  Widget build(BuildContext context) {
    final SignUpBloc _bloc = BlocProvider.of<SignUpBloc>(context);

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
              child: Image.asset('assets/img/sign_up_photo_blue.webp'),
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
                  Text('¡Comencemos!', style: appTheme.textTheme.headlineLarge),
                  SizedBox(height: SpacingTokens.sm),
                  Text(
                    'Ingrese sus datos para crear una cuenta.',
                    style: appTheme.textTheme.titleMedium,
                  ),
                  SizedBox(height: SpacingTokens.lg),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hintText: 'Email',
                          svgPath: "assets/icons/Message.svg",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: SpacingTokens.md),
                        CustomTextFormField(
                          hintText: 'Password',
                          svgPath: "assets/icons/Lock.svg",
                          obscureText: true,
                        ),
                        SizedBox(height: SpacingTokens.md),
                        CustomTextFormField(
                          hintText: 'Password',
                          svgPath: "assets/icons/Lock.svg",
                          obscureText: true,
                        ),
                        SizedBox(height: SpacingTokens.sm),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                            ),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: "Acepto los",
                                  style: appTheme.textTheme.titleMedium,
                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Navigator.pushNamed(
                                          //   context,
                                          //   'termsOfServicesScreenRoute',
                                          // );
                                        },
                                      text: " Terminos y Condiciones ",
                                      style: appTheme.textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SpacingTokens.xl),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 60),
                          ),
                          child: Text(
                            'Continuar',
                            style: TextStyle(fontSize: FontTokens.md),
                          ),
                          onPressed: () {
                            // context.pushNamed(mainScreenRoute);
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            context.pushNamed(signInScreenRoute);
                          },
                          child: Text(
                            '¿Tienes una cuenta? Inica Sesión',
                            style: appTheme.textTheme.titleMedium,
                          ),
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
