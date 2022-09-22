import 'package:dio/dio.dart';
import 'package:telemedicine_app/widgets/quotes/core/endpoint.dart';
import 'package:telemedicine_app/widgets/quotes/data/quotes_model.dart';

import '../../quotes/core/error/exceptions.dart';

abstract class QuotesRemoteDataSource {
  Future<QuotesModel> getQuotes();
}

class QuotesRemoteDataSourceImpl implements QuotesRemoteDataSource {
  final Dio client;

  QuotesRemoteDataSourceImpl({required this.client});
  @override
  Future<QuotesModel> getQuotes() async {
    // client.options.headers["Content-Type"] = "application/json";
    final response = await client.get(Endpoints.quotesEndpoint);
    if (response.statusCode == 200) {
      return QuotesModel.fromMap(response.data);
    } else {
      throw ServerException();
    }
  }
}