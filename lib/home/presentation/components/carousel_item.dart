import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel/home/domain/entity/character.dart';

class CarouselItem extends StatelessWidget {
  final Character character;

  const CarouselItem({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0, // elevation of the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          CachedNetworkImage(
            imageUrl: character.image?.imagePath ?? '',
            fit: BoxFit.cover, // fit the image inside the card
            height: 270, // height of the image
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  character.name,
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
