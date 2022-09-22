import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({required this.quote, Key? key}) : super(key: key);

  final String quote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '"$quote" - Ye',
        style: TextStyle(
            fontSize: quote.length >= 100 ? 20 : 24,
            fontWeight: FontWeight.w400,
            color: Colors.black,
        ),
        textAlign: TextAlign.center,
      )
    );
  }
}