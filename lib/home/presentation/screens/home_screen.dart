import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel/constants/routes_name.dart';
import 'package:marvel/home/presentation/components/carousel.dart';
import 'package:marvel/home/presentation/components/character_card.dart';
import 'package:marvel/home/presentation/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const String route = RouteNames.homeRoute;

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  late HomeController _homeController;

  @override
  void initState() {
    _homeController = GetIt.I.get<HomeController>();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_homeController.isFetchingMore) {
      _homeController.fetchMoreCharacters(
        lastIndex: _homeController.characters?.results?.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Marvel Characters'),
          actions: [
            IconButton(
              onPressed: () => _homeController.refreshAll(),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 24.0,
              ),
              Observer(builder: (_) {
                if (!_homeController.loadingCarousel) {
                  return Carousel(
                    characters: _homeController.carouselList,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Observer(
                  builder: (_) {
                    if (_homeController.loadingList) {
                      return const SizedBox.shrink();
                    }

                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _homeController.characters?.results?.length,
                          itemBuilder: (context, index) {
                            var character = _homeController.characters?.results?[index];
                            return CharacterCard(character: character);
                          },
                        ),
                        if (_homeController.isFetchingMore)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: LinearProgressIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
