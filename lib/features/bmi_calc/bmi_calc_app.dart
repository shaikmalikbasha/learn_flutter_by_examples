import 'package:flutter/material.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/input_page.dart';

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI-Calc',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // textTheme: TextTheme(
        //   bodySmall: TextStyle(color: Colors.white),
        //   bodyMedium: TextStyle(color: Colors.white),
        //   bodyLarge: TextStyle(color: Colors.white),
        // ),
        appBarTheme: AppBarThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF0A0E21),
        ),
      ),

      home: InputPage(),
    );
  }
}
