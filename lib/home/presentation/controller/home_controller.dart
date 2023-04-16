import 'package:marvel/home/domain/entity/character_list.dart';
import 'package:marvel/home/domain/usecase/fetch_random_char_usecase.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final FetchRandomCharactersUseCase _fetchRandomCharactersUseCase;

  _HomeControllerBase(this._fetchRandomCharactersUseCase) {
    fetchFiveRandomCharacters();
  }

  @observable
  CharacterList? characters;

  @observable
  late bool loading = false;

  @observable
  @action
  fetchFiveRandomCharacters() async {
    loading = true;

    await _fetchRandomCharactersUseCase.execute().then((result) {
      loading = false;
      result.fold((error) => print(error), (chars) => characters = chars);
    });
  }
}
