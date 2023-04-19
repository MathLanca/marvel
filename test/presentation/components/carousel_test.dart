import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/home/domain/entity/character.dart';
import 'package:marvel/home/domain/entity/character_image.dart';
import 'package:marvel/home/domain/entity/character_list.dart';
import 'package:marvel/home/presentation/components/carousel.dart';
import 'package:marvel/home/presentation/components/carousel_item.dart';

void main() {
  group('Carousel widget', () {
    Future<void> _injectWidget(WidgetTester tester, {required CharacterList? characters}) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Carousel(characters: characters),
          ),
        ),
      );

      await tester.pumpAndSettle();
    }

    testWidgets('should render empty list correctly', (tester) async {
      final characterList = CharacterList(1, 10, []);

      await _injectWidget(tester, characters: characterList);
      expect(find.byType(CarouselItem), findsNothing);
    });

    testWidgets('should render list with characters', (tester) async {
      final mockCharacter1 = Character(
        12313,
        'Super Hero 1',
        '',
        CharacterImage('http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784', 'jpg'),
      );
      final mockCharacter2 = Character(
        123143,
        'Super Hero 2',
        '',
        CharacterImage('http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784', 'jpg'),
      );
      final characterList = CharacterList(0, 2, [mockCharacter1, mockCharacter2]);

      await _injectWidget(tester, characters: characterList);
      expect(find.byType(Carousel), findsOneWidget);
      expect(find.byType(CarouselItem), findsWidgets);
    });

  });
}
