import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/data/datasource/fetch_random_char_datasource_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';



@GenerateNiceMocks([MockSpec<Dio>(as: #dioMock), MockSpec<DotEnv>(as: #dotEnvMock)])
import 'fetch_characters_datasource_test.mocks.dart';

void main() {
  final Dio _dio = dioMock();
  final DotEnv _dotEnv = dotEnvMock();

  const String endPoint = '/v1/public/characters';

  late FetchRandomCharactersDataSourceImpl dataSource;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await _dotEnv.load();
    when(_dotEnv.env).thenReturn({
      'API_KEY': 'key',
      'API_HASH': 'hash',
      'BASE_URL': 'url',
    });
    dataSource = FetchRandomCharactersDataSourceImpl(_dio, dotEnv: _dotEnv);
  });

  group('FetchRandomCharactersDataSourceImpl', () {
    test('should return CharacterList on successful API call', () async {
      // Arrange
      final response = Response(
        data: {
          "code": 200,
          "status": "Ok",
          "data": {
            "offset": 0,
            "limit": 20,
            "total": 1493,
            "count": 20,
            "results": [
              {
                "id": 1011334,
                "name": "3-D Man",
                "description": "",
                "modified": "2014-04-29T14:18:17-0400",
                "thumbnail": {"path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", "extension": "jpg"}
              }
            ]
          }
        },
        statusCode: 200,
        requestOptions: RequestOptions(),
      );

      when(_dio.get('url$endPoint', queryParameters: anyNamed('queryParameters'))).thenAnswer(
        (_) async => response,
      );

      // Act
      final result = await dataSource.execute();

      // Assert
      expect(result.isRight(), true);
      expect(result.fold((_) => null, (data) => data.results?.length), 1);
    });

    test('should return Left on unsuccessful API call', () async {
      final response = Response(
        data: {"code": 404, "status": "Not Found"},
        statusCode: 404,
        requestOptions: RequestOptions(),
      );

      when(_dio.get('url$endPoint', queryParameters: anyNamed('queryParameters'))).thenAnswer(
        (_) async => response,
      );

      final result = await dataSource.execute();

      expect(result.isLeft(), true);
    });

    test('should return Left on exception', () async {
      // Arrange
      when(_dio.get('url$endPoint', queryParameters: anyNamed('queryParameters'))).thenThrow(
        Exception(),
      );

      // Act
      final result = await dataSource.execute();

      // Assert
      expect(result.isLeft(), true);
    });
  });
}
