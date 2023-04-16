import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel/home/domain/entity/character_list.dart';

class Carousel extends StatefulWidget {
  final CharacterList? characters;

  const Carousel({required this.characters, super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;
  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final characters = widget.characters?.results;
    if (characters == null) {
      return const SizedBox.shrink();
    } else {
      return PageView.builder(
        controller: _pageController,
        itemCount: characters.length,
        pageSnapping: true,
        onPageChanged: (currentPage) => setState(() {
          activePage = currentPage;
        }),
        itemBuilder: (context, index) {
          final character = characters[index];
          return Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      character.image?.imagePath ?? '',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        character.name.toUpperCase(),
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              letterSpacing: 1,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: indicators(
                        characters.length,
                        activePage,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 6,
        height: 6,
        decoration: BoxDecoration(color: currentIndex == index ? Colors.white : Colors.black, shape: BoxShape.circle),
      );
    });
  }
}
