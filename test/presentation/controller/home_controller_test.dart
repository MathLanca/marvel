import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/domain/entity/character.dart';
import 'package:marvel/domain/entity/character_image.dart';
import 'package:marvel/domain/entity/character_list.dart';
import 'package:marvel/domain/usecase/fetch_characters_usecase.dart';
import 'package:marvel/domain/usecase/fetch_random_char_usecase.dart';
import 'package:marvel/presentation/controller/home_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<FetchRandomCharactersUseCase>(as: #fetchRandom),
  MockSpec<FetchCharactersUseCase>(as: #fetchAll),
])
import 'home_controller_test.mocks.dart';

void main() {
  late HomeController controller;
  final FetchRandomCharactersUseCase mockFetchRandom = fetchRandom();
  final FetchCharactersUseCase mockFetchAll = fetchAll();

  setUp(() {
    final characterList = CharacterList(
      0,
      20,
      [Character(1, 'Iron Man', '', CharacterImage('', ''))],
    );

    when(mockFetchRandom.execute()).thenAnswer((_) async => Right(characterList));
    when(mockFetchAll.execute()).thenAnswer((_) async => Right(characterList));
    controller = HomeController(mockFetchRandom, mockFetchAll);
  });

  group('fetchFiveRandomCharacters', () {
    test('should update carouselList when successful', () async {
      final characterList = CharacterList(
        0,
        20,
        [Character(1, 'Iron Man', '', CharacterImage('', ''))],
      );

      when(mockFetchRandom.execute()).thenAnswer((_) async => Right(characterList));

      await controller.fetchFiveRandomCharacters();

      expect(controller.carouselList, equals(characterList));
    });

    test('should print error when failed', () async {
      const error = 'Some error';

      when(mockFetchRandom.execute()).thenAnswer((_) async => Left(Exception(error)));

      await controller.fetchFiveRandomCharacters();

      verify(mockFetchRandom.execute());
      expect(controller.loadingCarousel, isFalse);
    });
  });

  group('fetchCharactersList', () {
    test('should update characters when successful', () async {
      final characterList = CharacterList(
        0,
        20,
        [Character(1, 'Iron Man', '', CharacterImage('', ''))],
      );

      when(mockFetchAll.execute()).thenAnswer((_) async => Right(characterList));

      await controller.fetchCharactersList();

      expect(controller.characters, equals(characterList));
    });

    test('should print error when failed', () async {
      const error = 'Some error';

      when(mockFetchAll.execute()).thenAnswer((_) async => Left(Exception(error)));

      await controller.fetchCharactersList();

      verify(mockFetchAll.execute());
      expect(controller.loadingList, isFalse);
    });
  });

  group('fetchMoreCharacters', () {
    test('should add characters to the list when successful', () async {
      final oldCharacterList = CharacterList(
        0,
        20,
        [Character(1, 'Iron Man', '', CharacterImage('', ''))],
      );

      final newCharacterList = CharacterList(
        0,
        20,
        [Character(2, 'Captain America', '', CharacterImage('', ''))],
      );

      when(mockFetchAll.execute(lastIndex: 0)).thenAnswer((_) async => Right(newCharacterList));

      controller.characters = oldCharacterList;
      await controller.fetchMoreCharacters(lastIndex: 0);

      final expectedList = CharacterList(
        0,
        20,
        [
          Character(1, 'Iron Man', '', CharacterImage('', '')),
          Character(2, 'Captain America', '', CharacterImage('', '')),
        ],
      );

      expect(controller.characters, equals(expectedList));
    });
  });
}
