import 'package:marvel/home/domain/entity/character_list.dart';
import 'package:marvel/home/domain/usecase/fetch_characters_usecase.dart';
import 'package:marvel/home/domain/usecase/fetch_random_char_usecase.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final FetchRandomCharactersUseCase _fetchRandom;
  final FetchCharactersUseCase _fetchAll;

  _HomeControllerBase(this._fetchRandom, this._fetchAll) {
    fetchFiveRandomCharacters();
    fetchCharactersList();
  }

  @observable
  CharacterList? carouselList;

  @observable
  CharacterList? characters;

  @observable
  bool loadingCarousel = false;

  @observable
  bool loadingList = false;

  @action
  fetchFiveRandomCharacters() async {
    loadingCarousel = true;

    await _fetchRandom.execute().then((result) {
      loadingCarousel = false;
      result.fold((error) => print(error), (chars) => carouselList = chars);
    });
  }

  @action
  fetchCharactersList() async {
    loadingList = true;

    await _fetchAll.execute().then((result) {
      loadingCarousel = false;
      result.fold((error) => print(error), (chars) => characters = chars);
    });

  }
}
