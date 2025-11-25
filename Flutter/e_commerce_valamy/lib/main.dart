import 'package:e_commerce_valamy/config/routes/path_routes.dart' as router;
import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/config/theme/app_theme.dart';
import 'package:e_commerce_valamy/src/presentation/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) => ProductsProvider()..loadPopularProducts(),
        // ),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Valamy',
        theme: lightTheme(context),
        // themeMode: ThemeMode.light,
        initialRoute: mainScreenRoute,
        onGenerateRoute: router.generateRoute,
        // routes: routes,
      ),
    );
  }
}
