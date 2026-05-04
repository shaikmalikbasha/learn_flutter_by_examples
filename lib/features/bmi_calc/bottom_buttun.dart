import 'package:flutter/material.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/constants.dart';

class BMIBottomButtun extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onTap;
  const BMIBottomButtun({this.buttonText, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 20.0),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(right: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Text(
          buttonText.toString(),
          style: kLargeButtonStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
