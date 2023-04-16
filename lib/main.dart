import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel/home/data/datasource/fetch_random_char_datasource_impl.dart';
import 'package:marvel/home/domain/datasource/fetch_random_char_datasource.dart';
import 'package:marvel/home/domain/usecase/fetch_random_char_usecase.dart';
import 'package:marvel/home/domain/usecase/fetch_random_char_usecase_impl.dart';
import 'package:marvel/home/presentation/controller/home_controller.dart';
import 'package:marvel/home/presentation/screens/home_screen.dart';
import 'package:marvel/theme/base_theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(ModularApp(module: AppModule(), child: const MyApp()));

  initializeDependencies();
}

class AppModule extends Module {
  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(HomeScreen.route, child: (context, args) => const HomeScreen()),
    ];
  }
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

initializeDependencies() {
  GetIt getIt = GetIt.I;

  getIt.registerFactory<FetchRandomCharactersDataSource>(
    () => FetchRandomCharactersDataSourceImpl(Dio()),
  );
  getIt.registerFactory<FetchRandomCharactersUseCase>(
    () => FetchRandomCharactersUseCaseImpl(getIt()),
  );
  getIt.registerFactory<HomeController>(() => HomeController(getIt()));
}
