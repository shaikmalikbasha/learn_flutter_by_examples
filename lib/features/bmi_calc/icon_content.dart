import 'package:flutter/material.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/constants.dart';

class IconContentWidget extends StatelessWidget {
  final IconData icon;
  final String iconText;

  const IconContentWidget({
    required this.icon,
    required this.iconText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: kIconSize),
        SizedBox(height: 15.0),
        Text(iconText, style: kLableStyle),
      ],
    );
  }
}
