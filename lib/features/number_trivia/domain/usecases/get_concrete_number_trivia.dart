import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/errors/failures.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;

  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await this.repository.getConcreteNumberTrivia(params.number);
  }
}
