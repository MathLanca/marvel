import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel/domain/entity/character.dart';

class CharacterCard extends StatelessWidget {
  final Character? character;
  const CharacterCard({this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(character?.image?.imagePath),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextCard(
                  context,
                  character?.name ?? 'No name character',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                _buildTextCard(
                  context,
                  character?.description ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14.0, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String? imagePath) {
    return Expanded(
      flex: 2,
      child: CachedNetworkImage(
        imageUrl: imagePath ?? '',
        fit: BoxFit.fitHeight,
        placeholder: (context, url) => const CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildTextCard(BuildContext context, String text, {TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        text,
        style: style,
        maxLines: 5,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
