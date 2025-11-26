import 'package:e_commerce_valamy/config/bloc_providers.dart';
import 'package:e_commerce_valamy/config/routes/router.dart';
import 'package:e_commerce_valamy/config/theme/app_theme.dart';
import 'package:e_commerce_valamy/src/infrastructure/data_sources/product_local_datasource_impl.dart';
import 'package:e_commerce_valamy/src/infrastructure/repositories/product_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final productRepository = ProductRepositoryImpl(
      productDatasource: ProductLocalDatasource(),
    );

    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        title: 'Valamy',
        theme: lightTheme(context),
        // themeMode: ThemeMode.light,
        // initialRoute: mainScreenRoute,
        // onGenerateRoute: router.generateRoute,
        // routes: routes,
      ),
    );
  }
}
