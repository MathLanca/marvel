import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel/constants/strings.dart';
import 'package:marvel/domain/entity/character.dart';
import 'package:marvel/domain/entity/character_image.dart';
import 'package:marvel/domain/entity/character_list.dart';
import 'package:marvel/presentation/components/carousel.dart';
import 'package:marvel/presentation/components/character_card.dart';
import 'package:marvel/presentation/controller/home_controller.dart';
import 'package:marvel/presentation/screens/home_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_screen_test.mocks.dart';

@GenerateMocks([HomeController])
void main() {
  final homeControllerMock = MockHomeController();

  setUp(() => GetIt.instance.registerSingleton<HomeController>(homeControllerMock));

  tearDown(() => GetIt.instance.unregister(instance: homeControllerMock));

  group('HomeScreen widget test', () {
    testWidgets('should show carousel and card list when it is not loading', (tester) async {
      final characters = CharacterList(0, 20, [Character(123, 'Hero 1', '', CharacterImage('http://i.annihil.us/u/prod/marvel/i/mg/a/f0/5202887448860', 'jpg'))]);

      when(homeControllerMock.loadingList).thenReturn(false);
      when(homeControllerMock.loadingCarousel).thenReturn(false);
      when(homeControllerMock.characters).thenReturn(characters);
      when(homeControllerMock.isFetchingMore).thenReturn(false);
      when(homeControllerMock.carouselList).thenReturn(characters);

      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.text(homeScreenTitle), findsOneWidget);
      expect(find.byType(Carousel), findsOneWidget);
      expect(find.byType(CharacterCard), findsOneWidget);
    });

    testWidgets('shouldnt show carousel when it is loading', (tester) async {
      final characters = CharacterList(0, 20, [Character(123, 'Hero 1', '', CharacterImage('http://i.annihil.us/u/prod/marvel/i/mg/a/f0/5202887448860', 'jpg'))]);

      when(homeControllerMock.loadingList).thenReturn(true);
      when(homeControllerMock.characters).thenReturn(characters);
      when(homeControllerMock.loadingCarousel).thenReturn(true);
      when(homeControllerMock.isFetchingMore).thenReturn(true);
      when(homeControllerMock.carouselList).thenReturn(characters);

      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.text(homeScreenTitle), findsOneWidget);
      expect(find.byType(Carousel), findsNothing);
      expect(find.byType(CharacterCard), findsNothing);
    });

    testWidgets('shouldnt show linear loarder when it is loading', (tester) async {
      final characters = CharacterList(0, 20, [Character(123, 'Hero 1', '', CharacterImage('http://i.annihil.us/u/prod/marvel/i/mg/a/f0/5202887448860', 'jpg'))]);

      when(homeControllerMock.loadingList).thenReturn(false);
      when(homeControllerMock.characters).thenReturn(characters);
      when(homeControllerMock.loadingCarousel).thenReturn(false);
      when(homeControllerMock.isFetchingMore).thenReturn(true);
      when(homeControllerMock.carouselList).thenReturn(characters);

      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });
  });
}
