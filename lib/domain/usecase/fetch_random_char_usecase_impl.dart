import 'package:dartz/dartz.dart';
import 'package:marvel/domain/datasource/fetch_random_char_datasource.dart';
import 'package:marvel/domain/entity/character_list.dart';
import 'package:marvel/domain/usecase/fetch_random_char_usecase.dart';

class FetchRandomCharactersUseCaseImpl implements FetchRandomCharactersUseCase {
  final FetchRandomCharactersDataSource _fetchRandomCharactersDataSource;

  FetchRandomCharactersUseCaseImpl(this._fetchRandomCharactersDataSource);

  @override
  Future<Either<Exception, CharacterList>> execute() {
    return _fetchRandomCharactersDataSource.execute();
  }
}
