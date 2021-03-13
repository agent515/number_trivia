import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import '../fixtures/fixtures.dart';
import 'dart:convert';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test('NumberTriviaModel should be a subclass of NumberTrivia entity', () {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJSON', () {
    test('should take a valid integer as a number', () {
      final Map<String, dynamic> temp = json.decode(fixtures('trivia.json'));

      final result = NumberTriviaModel.fromJSON(temp);

      expect(result, tNumberTriviaModel);
    });

    test('should take integer regarded as double as a number', () {
      final Map<String, dynamic> temp = json.decode(fixtures('trivia.json'));

      final result = NumberTriviaModel.fromJSON(temp);

      expect(result, tNumberTriviaModel);
    });

  });

  group('toJSON', () {
    test('should give a valid JSON object from NumberTrivia object', () {
      final Map<String, dynamic> temp = {
        'number': 1,
        'text': 'Test Text'
      };

      final result = tNumberTriviaModel.toJSON();

      expect(result, temp);
    });

  });
}