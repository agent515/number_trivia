import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:number_trivia/core/errors/exceptions.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:matcher/matcher.dart' as matcher;
import '../fixtures/fixtures.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  NumberTriviaRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getConcrteNumberTrivia', () {
    final tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel.fromJSON(json.decode(fixtures('trivia.json')));
    test('''should perform a GET request on a url with number being the endpoint
        and with application/json header''', () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixtures('trivia.json'), 200));

      dataSource.getConcreteNumberTrivia(tNumber);

      verify(mockHttpClient.get(Uri.http('numbersapi.com', '$tNumber'),
          headers: {'Content-Type': 'application/json'}));
    });

    test('should return NumberTrivia when the response code is 200', () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixtures('trivia.json'), 200));

      final result = await dataSource.getConcreteNumberTrivia(tNumber);

      expect(result, tNumberTriviaModel);
    });

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response('Something went wrong', 404),
        );
        // act
        final call = dataSource.getConcreteNumberTrivia;
        // assert
        expect(() => call(tNumber),
            throwsA(matcher.TypeMatcher<ServerException>()));
      },
    );
  });

  group('getRandomTrivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJSON(json.decode(fixtures('trivia.json')));
    test('''should perform a GET request on a url with number being the endpoint
        and with application/json header''', () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixtures('trivia.json'), 200));

      dataSource.getRandomNumberTrivia();

      verify(mockHttpClient.get(Uri.http('numbersapi.com', 'random'),
          headers: {'Content-Type': 'application/json'}));
    });

    test('should return NumberTrivia when the response code is 200', () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixtures('trivia.json'), 200));

      final result = await dataSource.getRandomNumberTrivia();

      expect(result, tNumberTriviaModel);
    });

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response('Something went wrong', 404),
        );
        // act
        final call = dataSource.getRandomNumberTrivia;
        // assert
        expect(() => call(), throwsA(matcher.TypeMatcher<ServerException>()));
      },
    );
  });
}
