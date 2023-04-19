import 'package:dartz/dartz.dart';
import 'package:marvel/home/domain/entity/character_list.dart';

abstract class FetchRandomCharactersDataSource {
  Future<Either<Exception, CharacterList>> execute();
}