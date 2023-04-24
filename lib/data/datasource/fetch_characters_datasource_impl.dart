import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel/constants/strings.dart';
import 'package:marvel/domain/datasource/fetch_characters_datasource.dart';
import 'package:marvel/domain/entity/character_list.dart';
import 'package:marvel/utils/exception/exception_handler.dart';
import 'package:marvel/utils/exception/exceptions.dart';

class FetchCharactersDataSourceImpl implements FetchCharactersDataSource {
  final Dio _http;
  late DotEnv _dotEnv;

  FetchCharactersDataSourceImpl(this._http, {DotEnv? dotEnv}) {
    _dotEnv = dotEnv ??= DotEnv();
  }

  @override
  Future<Either<Exception, CharacterList>> execute({int? lastIndex}) async {
    await _dotEnv.load();
    
    final String? baseUrl = _dotEnv.env['BASE_URL'];
    final String? apiKey = _dotEnv.env['API_KEY'];
    final String? apiHash = _dotEnv.env['API_HASH'];
    const String endPoint = '/v1/public/characters';

    if (baseUrl == null || apiKey == null || apiHash == null) {
      return Left(NoEnvValuesException(notEnvValueMsg));
    }

    String path = baseUrl + endPoint;

    Map<String, dynamic>? queryParams = {
      'ts': 1,
      'apikey': apiKey,
      'hash': apiHash,
      'offset': lastIndex ?? 0,
    };

    try {
      final response = await _http.get(path, queryParameters: queryParams);

      if (response.statusCode != 200) {
        return Left(ExceptionHandler.handle(response.statusCode, response));
      }

      final CharacterList result = CharacterList.fromMap(response.data);
      return Right(result);
    } catch (error) {
      return Left(Exception('Failed to request $error'));
    }
  }

}