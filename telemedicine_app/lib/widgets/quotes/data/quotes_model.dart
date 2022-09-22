import 'dart:convert';

import 'package:telemedicine_app/widgets/quotes/core/domain/quotes_entity.dart';

class QuotesModel {
  final String quote;

  QuotesModel({required this.quote});

  Quotes toEntity() => Quotes(quote: quote);

  factory QuotesModel.fromEntity(Quotes entity) {
    return QuotesModel(quote: entity.quote);
  }

  factory QuotesModel.fromMap(Map<String, dynamic> map) {
    return QuotesModel(quote: map['quote']);
  }

  factory QuotesModel.fromJson(String source) =>
      QuotesModel.fromMap(jsonDecode(source));
}