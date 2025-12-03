import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/config/routes/routes.dart';
import 'package:bee_viajes_turismo/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInMobileScreen extends StatefulWidget {
  final ThemeData appTheme;
  final GlobalKey<FormState>? formKey;

  const SignInMobileScreen({super.key, required this.appTheme, this.formKey});

  @override
  State<SignInMobileScreen> createState() => _SignInMobileScreenState();
}

class _SignInMobileScreenState extends State<SignInMobileScreen> {
  @override
  Widget build(BuildContext context) {
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
                    style: widget.appTheme.textTheme.headlineMedium,
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
                    style: widget.appTheme.textTheme.headlineLarge,
                  ),
                  SizedBox(height: SpacingTokens.sm),
                  Text(
                    'Inicia sesión con los datos que te registraste',
                    style: widget.appTheme.textTheme.titleMedium,
                  ),
                  SizedBox(height: SpacingTokens.lg),
                  Form(
                    key: widget.formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          labelText: 'Email',
                          hintText: 'Email',
                          svgPath: 'assets/icons/Message.svg',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: SpacingTokens.md),
                        CustomTextFormField(
                          labelText: 'Password',
                          hintText: 'Password',
                          svgPath: 'assets/icons/Lock.svg',
                          obscureText: true,
                        ),
                        SizedBox(height: SpacingTokens.sm),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: widget.appTheme.textTheme.titleMedium,
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
                            context.pushNamed(mainScreenRoute);
                          },
                        ),
                        SizedBox(height: SpacingTokens.xs),
                        TextButton(
                          child: Text(
                            '¿No tienes una cuenta? Registrate',
                            style: widget.appTheme.textTheme.titleMedium,
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
