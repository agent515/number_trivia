import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:meta/meta.dart';

class NumberTriviaModel extends NumberTrivia {
  final int number;
  final String text;

  NumberTriviaModel({
    @required this.number,
    @required this.text,
  }) : super(number: number, text: text);

  factory NumberTriviaModel.fromJSON(Map<String, dynamic> jsonResponse) {
    return NumberTriviaModel(
        number: (jsonResponse['number'] as num).toInt(),
        text: jsonResponse['text']);
  }

  Map<String, dynamic> toJSON() {
    return {'number': this.number, 'text': this.text};
  }
}
