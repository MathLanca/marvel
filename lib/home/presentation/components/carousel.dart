import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvel/home/domain/entity/character.dart';
import 'package:marvel/home/domain/entity/character_list.dart';
import 'package:marvel/home/presentation/components/carousel_item.dart';

class Carousel extends StatelessWidget {
  final CharacterList? characters;

  const Carousel({required this.characters, super.key});

  @override
  Widget build(BuildContext context) {
    final chars = characters?.results;

    return CarouselSlider(
      items: _buildCarouselList(chars),
      options: CarouselOptions(
          enlargeCenterPage: true,
          height: 350,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.easeInOutQuad,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.7),
    );
  }

  List<Widget> _buildCarouselList(List<Character>? characters) {
    if (characters == null || characters.isEmpty) {
      return [const SizedBox.shrink()];
    } else {
      List<Widget> carouselItems = [];
      for (var character in characters) {
        carouselItems.add(CarouselItem(character: character));
      }

      return carouselItems;
    }
  }
}
