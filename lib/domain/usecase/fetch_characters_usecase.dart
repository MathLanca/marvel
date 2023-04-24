import 'package:dartz/dartz.dart';
import 'package:marvel/domain/entity/character_list.dart';

abstract class FetchCharactersUseCase {
  Future<Either<Exception, CharacterList>> execute({int? lastIndex});
}
