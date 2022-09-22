import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:telemedicine_app/widgets/quotes/data/quotes_repository_impl.dart';
import 'package:telemedicine_app/widgets/quotes/quotes_widget_controller.dart';

import 'package:telemedicine_app/widgets/quotes/data/quotes_remote_datasource.dart';
import 'package:telemedicine_app/widgets/quotes/core/domain/quotes_repository.dart';

import 'package:telemedicine_app/widgets/quotes/core/domain/fetch_quotes_usecase.dart';

GetIt locator = GetIt.instance;

class Locator {
  static void injectDependencies() {
    locator.registerSingleton<Dio>(Dio());

    locator.registerFactory<QuotesRemoteDataSource>(
        () => QuotesRemoteDataSourceImpl(client: locator<Dio>()));

    locator.registerFactory<QuotesRepository>(() => QuotesRepositoryImpl(
        remoteDataSource: locator<QuotesRemoteDataSource>()));

    locator.registerFactory<FetchPhraseUsecase>(() =>
        FetchPhraseUsecaseImpl(repository: locator<QuotesRepository>()));

    locator.registerFactory<QuoteWidgetController>(() =>
        QuoteWidgetController(fetchPhraseUsecase: locator<FetchPhraseUsecase>()));
  }
}