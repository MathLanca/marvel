import 'package:flutter/material.dart';
import 'package:marvel/constants/routes_name.dart';
import 'package:marvel/constants/strings.dart';

class HomeScreen extends StatefulWidget {
  static const String route = RouteNames.homeRoute;

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            homeScreenTitle,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(children: [
          Card(
            color: Theme.of(context).colorScheme.tertiary,
            child: const SizedBox(
              height: 200,
              width: 354,
              child: Center(child: Text('Carrossel de 5 personagens')),
            ),
          )
        ]),
      ),
    );
  }
}
