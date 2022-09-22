import 'package:dartz/dartz.dart';
import 'package:telemedicine_app/widgets/quotes/core/domain/quotes_entity.dart';
import 'package:telemedicine_app/widgets/quotes/core/domain/quotes_repository.dart';

import '../../core/error/failures.dart';

abstract class FetchPhraseUsecase {
  Future<Either<Failure, Quotes>> call();
}

class FetchPhraseUsecaseImpl implements FetchPhraseUsecase {
  final QuotesRepository repository;

  FetchPhraseUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, Quotes>> call() async {
    final phrase = await repository.fetchPhrase();
    return phrase;
  }
}