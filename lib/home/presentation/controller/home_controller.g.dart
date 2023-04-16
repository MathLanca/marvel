// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
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

  late final _$loadingAtom =
      Atom(name: '_HomeControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$fetchFiveRandomCharactersAsyncAction = AsyncAction(
      '_HomeControllerBase.fetchFiveRandomCharacters',
      context: context);

  @override
  ObservableFuture fetchFiveRandomCharacters() {
    return ObservableFuture(_$fetchFiveRandomCharactersAsyncAction
        .run(() => super.fetchFiveRandomCharacters()));
  }

  @override
  String toString() {
    return '''
characters: ${characters},
loading: ${loading}
    ''';
  }
}
