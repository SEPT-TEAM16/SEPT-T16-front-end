import 'package:dartz/dartz.dart';
import 'package:telemedicine_app/widgets/quotes/core/error/failures.dart';

import 'package:telemedicine_app/widgets/quotes/core/domain/quotes_entity.dart';


abstract class QuotesRepository {
  Future<Either<Failure, Quotes>> fetchPhrase();
}
