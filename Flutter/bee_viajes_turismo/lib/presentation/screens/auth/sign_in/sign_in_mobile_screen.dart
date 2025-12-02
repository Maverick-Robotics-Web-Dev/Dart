import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:flutter/material.dart';

class SignInMobileScreen extends StatefulWidget {
  final double maxHeight;
  final double maxWidth;
  final ThemeData appTheme;
  final GlobalKey<FormState>? formKey;

  const SignInMobileScreen({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    required this.appTheme,
    this.formKey,
  });

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
                  SizedBox(width: 20),
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
                  SizedBox(height: 8),
                  Text(
                    'Inicia sesión con los datos que te registraste',
                    style: widget.appTheme.textTheme.titleMedium,
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
