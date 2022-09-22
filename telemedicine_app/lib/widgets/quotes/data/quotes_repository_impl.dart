import 'package:dartz/dartz.dart';

import 'package:telemedicine_app/widgets/quotes/core/error/exceptions.dart';
import 'package:telemedicine_app/widgets/quotes/core/error/failures.dart';

import 'package:telemedicine_app/widgets/quotes/data/quotes_remote_datasource.dart';
import 'package:telemedicine_app/widgets/quotes/core/domain/quotes_entity.dart';
import 'package:telemedicine_app/widgets/quotes/core/domain/quotes_repository.dart';


class QuotesRepositoryImpl implements QuotesRepository {
  final QuotesRemoteDataSource remoteDataSource;

  QuotesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Quotes>> fetchPhrase() async {
    try {
      final remoteQuote = await remoteDataSource.getQuotes();
      return Right(remoteQuote.toEntity());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}