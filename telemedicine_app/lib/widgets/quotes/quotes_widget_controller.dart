import 'package:flutter/foundation.dart';
import 'package:telemedicine_app/widgets/quotes/core/error/failures.dart';
import 'package:telemedicine_app/widgets/quotes/core/domain/fetch_quotes_usecase.dart';

class QuoteWidgetController {
  final FetchPhraseUsecase fetchPhraseUsecase;

  QuoteWidgetController({required this.fetchPhraseUsecase});
  String quote = "";
  Failure? failure;
  final ValueNotifier<String> valueNotifier = ValueNotifier("");
  void init() async {
    await callUsecase();
  }

  Future<void> callUsecase() async {
    final usecaseResponse = await fetchPhraseUsecase();
    usecaseResponse.fold(
      (l) => failure = l,
      (r) => quote = r.quote,
    );
    valueNotifier.value = quote;
  }
}