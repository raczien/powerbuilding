import 'package:flutter/material.dart';
import 'pages/input_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF14171C),
        scaffoldBackgroundColor: Color(0xFF14171C),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('de'),
      ],
      home: InputPage(),
    );
  }
}
