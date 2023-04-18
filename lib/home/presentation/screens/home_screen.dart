import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel/constants/routes_name.dart';
import 'package:marvel/home/presentation/components/carousel.dart';
import 'package:marvel/home/presentation/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const String route = RouteNames.homeRoute;

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController _homeController;

  @override
  void initState() {
    _homeController = GetIt.I.get<HomeController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Marvel Characters'),
          actions: [
            IconButton(
              onPressed: () => _homeController.fetchFiveRandomCharacters(),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Observer(builder: (_) {
            if (_homeController.loadingCarousel && _homeController.loadingList) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                const SizedBox(
                  height: 24.0,
                ),
                Carousel(
                  characters: _homeController.carouselList,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _homeController.characters?.results?.length,
                    itemBuilder: (context, index) {
                      return Text(_homeController.characters?.results?[index].name ?? '');
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
