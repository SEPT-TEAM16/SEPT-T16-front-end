import 'package:flutter/material.dart';
import 'package:telemedicine_app/widgets/quotes/core/locator.dart';
import 'package:telemedicine_app/widgets/quotes/quotes_widget.dart';

import 'package:telemedicine_app/widgets/quotes/quotes_widget_controller.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  final QuoteWidgetController controller = locator.get();
  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Ye Quotes"),
      ),
      
      body: Stack(
        children: [
          Positioned(
            top: 320,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: 200,
                width: 170,
                child: ValueListenableBuilder(
                    valueListenable: controller.valueNotifier,
                    builder: (context, value, child) {
                      if (controller.failure == null) {
                        return QuoteWidget(quote: value.toString());
                      } else {
                        return const QuoteWidget(
                            quote: "Sorry, the server is off");
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}