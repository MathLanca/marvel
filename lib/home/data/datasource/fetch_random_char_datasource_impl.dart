import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel/constants/strings.dart';
import 'package:marvel/home/domain/entity/character_list.dart';
import 'package:marvel/utils/exception/exception_handler.dart';
import 'package:marvel/utils/exception/exceptions.dart';
import 'package:marvel/home/domain/datasource/fetch_random_char_datasource.dart';

class FetchRandomCharactersDataSourceImpl implements FetchRandomCharactersDataSource {
  final Dio _http;
  FetchRandomCharactersDataSourceImpl(this._http);

  @override
  Future<Either<Exception, CharacterList>> execute() async {
    final String? baseUrl = dotenv.env['BASE_URL'];
    final String? apiKey = dotenv.env['API_KEY'];
    final String? apiHash = dotenv.env['API_HASH'];
    const String endPoint = '/v1/public/characters';

    if (baseUrl == null || apiKey == null || apiHash == null) {
      return Left(NoEnvValuesException(notEnvValueMsg));
    }

    String path = baseUrl + endPoint;

    final Random random = Random();

    Map<String, dynamic>? queryParams = {
      'ts': 1,
      'apikey': apiKey,
      'hash': apiHash,
      'limit': 5,
      'offset': random.nextInt(1556),
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
