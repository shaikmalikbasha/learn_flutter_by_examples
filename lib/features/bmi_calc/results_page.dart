import 'package:flutter/material.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/bottom_buttun.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/constants.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResults;
  final String bmiText;
  final String interpretation;

  const ResultsPage({
    required this.bmiResults,
    required this.bmiText,
    required this.interpretation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI - Results')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Results!',
                style: kTitleTextStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmiResults, style: kResultTextStyle),
                  Text(bmiText, style: kBMITextStyle),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BMIBottomButtun(
            buttonText: 'RE - CALCULATE',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
