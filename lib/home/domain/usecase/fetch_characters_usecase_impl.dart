import 'package:marvel/home/domain/datasource/fetch_characters_datasource.dart';
import 'package:marvel/home/domain/entity/character_list.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel/home/domain/usecase/fetch_characters_usecase.dart';

class FetchCharactersUseCaseImpl implements FetchCharactersUseCase {
  final FetchCharactersDataSource _dataSource;

  FetchCharactersUseCaseImpl(this._dataSource);

  @override
  Future<Either<Exception, CharacterList>> execute({int? lastIndex}) {
    return _dataSource.execute(lastIndex: lastIndex);
  }
}
