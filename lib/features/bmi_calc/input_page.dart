import 'package:flutter/material.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/bottom_buttun.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/calculator_brain.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/constants.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/icon_content.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/results_page.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/reusable_card.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/round_icon.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = kInActiveCardColor;
  // Color femaleCardColor = kInActiveCardColor;

  Gender? selectedGender;
  int height = 180;
  int weight = 50;
  int age = 20;

  // // 1 - MALE, 2 - FEMALE
  // void updateColor(Gender selectedGender) {
  //   setState(() {
  //     maleCardColor = (selectedGender == Gender.male)
  //         ? activeCardColor
  //         : kInActiveCardColor;
  //     femaleCardColor = (selectedGender == Gender.female)
  //         ? activeCardColor
  //         : kInActiveCardColor;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI - Calc')),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContentWidget(
                      icon: Icons.male,
                      iconText: 'MALE',
                    ),
                    onPress: () => {
                      setState(() {
                        selectedGender = Gender.male;
                      }),
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () => {
                      setState(() {
                        selectedGender = Gender.female;
                      }),
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContentWidget(
                      icon: Icons.female,
                      iconText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: Text('HEIGHT', style: kLableStyle)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text('cm', style: kLableStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 16.0,
                      ),
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 250.0,
                      onChanged: (value) => {
                        setState(() {
                          height = value.toInt();
                        }),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLableStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(weight.toString(), style: kNumberTextStyle),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconData: Icons.add,
                              onPressed: () => {
                                setState(() {
                                  weight++;
                                }),
                              },
                            ),
                            SizedBox(width: 7.5),
                            RoundIconButton(
                              iconData: Icons.remove,
                              onPressed: () => {
                                setState(() {
                                  weight--;
                                }),
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLableStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(age.toString(), style: kNumberTextStyle),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconData: Icons.add,
                              onPressed: () => {
                                setState(() {
                                  age++;
                                }),
                              },
                            ),
                            SizedBox(width: 7.5),
                            RoundIconButton(
                              iconData: Icons.remove,
                              onPressed: () => {
                                setState(() {
                                  age--;
                                }),
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BMIBottomButtun(
            buttonText: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiText: calc.calculateBMI(),
                    bmiResults: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
