import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/domain/entity/character.dart';
import 'package:marvel/domain/entity/character_image.dart';
import 'package:marvel/presentation/components/carousel_item.dart';

void main() {
  Future<void> _injectWidget(WidgetTester tester, {required Character character}) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CarouselItem(character: character),
        ),
      ),
    );

    await tester.pumpAndSettle();
  }

  group('CarouselItem', () {
    testWidgets('should render one Image and text', (tester) async {
      await _injectWidget(
        tester,
        character: Character(
          123,
          'Super Hero',
          '',
          CharacterImage(
            'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784',
            'jpg',
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
      expect(find.text('Super Hero'), findsOneWidget);
      expect(
          find.image(
            const CachedNetworkImageProvider(
              'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
            ),
          ),
          findsOneWidget);
    });

    testWidgets('should render only text if image is null', (tester) async {
      await _injectWidget(
        tester,
        character: Character(123, 'Super Hero', '', null),
      );

      expect(find.byType(Card), findsOneWidget);
      expect(find.text('Super Hero'), findsOneWidget);
      expect(
        find.image(
          const CachedNetworkImageProvider(
            'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
          ),
        ),
        findsNothing,
      );
    });
  });
}
