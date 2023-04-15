import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel/home/presentation/screens/home_screen.dart';
import 'package:marvel/theme/base_theme.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute(HomeScreen.route, child: (context, args) => const HomeScreen()),
  ];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: BaseTheme.build(),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
