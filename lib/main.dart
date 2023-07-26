import 'screen/result_page.dart';
import 'package:flutter/material.dart';
import 'screen/input_page.dart';

MaterialColor customPrimarySwatch = const MaterialColor(
  0xFF0A0E21,
  <int, Color>{
    50: Color(0xFF0A0E21),
    100: Color(0xFF0A0E21),
    200: Color(0xFF0A0E21),
    300: Color(0xFF0A0E21),
    400: Color(0xFF0A0E21),
    500: Color(0xFF0A0E21),
    600: Color(0xFF0A0E21),
    700: Color(0xFF0A0E21),
    800: Color(0xFF0A0E21),
    900: Color(0xFF0A0E21),
  },
);
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultPage(
          bmiResult: '',
          bmiInterpretation: '',
          resultText: '',
        )
      },
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: customPrimarySwatch,
          ).copyWith(
            secondary: const Color(0xffCC47EC),
          ),
          scaffoldBackgroundColor: customPrimarySwatch,
          textTheme:
              TextTheme(bodyMedium: TextStyle(color: Color(0xFF8D8E98)))),
    );
  }
}
