import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel/constants/routes_name.dart';
import 'package:marvel/home/presentation/components/carousel_item.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Observer(
                builder: (_) {
                  if (_homeController.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                      height: 250,
                      child: Carousel(
                        characters: _homeController.characters,
                      ),
                    );
                    // var img = _homeController.characters?.results?[4].image;
                    // return Stack(
                    //   fit: StackFit.passthrough,
                    //   children: [
                    //     CachedNetworkImage(
                    //       placeholder: (context, url) => const CircularProgressIndicator(),
                    //       imageUrl: img?.imagePath ?? '',
                    //       fit: BoxFit.fill,
                    //     ),
                    //     Center(
                    //       child: Container(
                    //         width: double.maxFinite,
                    //         decoration: BoxDecoration(
                    //           color: Colors.black38.withOpacity(0.3),
                    //         ),
                    //         child: Text(
                    //           _homeController.characters?.results?[4].name ?? '',
                    //           style: Theme.of(context).textTheme.headlineLarge,
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // );
                  }
                },
              ),
              Container(
                color: Colors.yellow,
                height: 200,
              ),
              Container(
                color: Colors.indigoAccent,
                height: 200,
              ),
              Container(
                color: Colors.red,
                height: 200,
              ),
              Container(
                color: Colors.yellow,
                height: 200,
              ),
              Container(
                color: Colors.indigoAccent,
                height: 200,
              ),
              Container(
                color: Colors.red,
                height: 200,
              ),
              Container(
                color: Colors.yellow,
                height: 200,
              ),
              Container(
                color: Colors.indigoAccent,
                height: 200,
              ),
              Container(
                color: Colors.red,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
