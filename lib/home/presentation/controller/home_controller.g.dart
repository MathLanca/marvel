// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$carouselListAtom =
      Atom(name: '_HomeControllerBase.carouselList', context: context);

  @override
  CharacterList? get carouselList {
    _$carouselListAtom.reportRead();
    return super.carouselList;
  }

  @override
  set carouselList(CharacterList? value) {
    _$carouselListAtom.reportWrite(value, super.carouselList, () {
      super.carouselList = value;
    });
  }

  late final _$charactersAtom =
      Atom(name: '_HomeControllerBase.characters', context: context);

  @override
  CharacterList? get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(CharacterList? value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$loadingCarouselAtom =
      Atom(name: '_HomeControllerBase.loadingCarousel', context: context);

  @override
  bool get loadingCarousel {
    _$loadingCarouselAtom.reportRead();
    return super.loadingCarousel;
  }

  @override
  set loadingCarousel(bool value) {
    _$loadingCarouselAtom.reportWrite(value, super.loadingCarousel, () {
      super.loadingCarousel = value;
    });
  }

  late final _$loadingListAtom =
      Atom(name: '_HomeControllerBase.loadingList', context: context);

  @override
  bool get loadingList {
    _$loadingListAtom.reportRead();
    return super.loadingList;
  }

  @override
  set loadingList(bool value) {
    _$loadingListAtom.reportWrite(value, super.loadingList, () {
      super.loadingList = value;
    });
  }

  late final _$fetchFiveRandomCharactersAsyncAction = AsyncAction(
      '_HomeControllerBase.fetchFiveRandomCharacters',
      context: context);

  @override
  Future fetchFiveRandomCharacters() {
    return _$fetchFiveRandomCharactersAsyncAction
        .run(() => super.fetchFiveRandomCharacters());
  }

  late final _$fetchCharactersListAsyncAction =
      AsyncAction('_HomeControllerBase.fetchCharactersList', context: context);

  @override
  Future fetchCharactersList() {
    return _$fetchCharactersListAsyncAction
        .run(() => super.fetchCharactersList());
  }

  @override
  String toString() {
    return '''
carouselList: ${carouselList},
characters: ${characters},
loadingCarousel: ${loadingCarousel},
loadingList: ${loadingList}
    ''';
  }
}
