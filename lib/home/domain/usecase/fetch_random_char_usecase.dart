import 'package:dartz/dartz.dart';
import 'package:marvel/home/domain/entity/character_list.dart';

abstract class FetchRandomCharactersUseCase {
  Future<Either<Exception, CharacterList>> execute();
}
