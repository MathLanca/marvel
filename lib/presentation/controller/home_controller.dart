import 'package:marvel/domain/entity/character_list.dart';
import 'package:marvel/domain/usecase/fetch_characters_usecase.dart';
import 'package:marvel/domain/usecase/fetch_random_char_usecase.dart';
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

  @observable
  bool isFetchingMore = false;

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
      loadingList = false;
      result.fold((error) => print(error), (chars) => characters = chars);
    });
  }

  @action
  fetchMoreCharacters({int? lastIndex}) async {
    isFetchingMore = true;
    await _fetchAll.execute(lastIndex: lastIndex).then((result) {
      result.fold((error) => print(error), (result) {
        isFetchingMore = false;
        if (characters?.results != null) {
          characters?.results!.addAll(result.results?.toList() ?? []);
          characters = characters;
          print(characters?.results?.length);
        }
      });
    });
  }

  @action
  refreshAll() async {
    fetchCharactersList();
    fetchFiveRandomCharacters();
  }
}
