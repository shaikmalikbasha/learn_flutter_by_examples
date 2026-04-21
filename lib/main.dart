import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_flutter_by_examples/utils/constants.dart';

String getRandomImageUrl() {
  final images = <String>[
    'images/dice1.png',
    'images/dice2.png',
    'images/dice3.png',
    'images/dice4.png',
    'images/dice5.png',
    'images/dice6.png',
  ];

  Random random = Random();
  return images[random.nextInt(images.length)];
}

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      home: Scaffold(
        backgroundColor: Colors.red.shade900,
        appBar: AppBar(
          elevation: 4.0,
          shadowColor: Colors.black,
          backgroundColor: Colors.red.shade900,
          title: Text(
            appName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3.0,
            ),
          ),
        ),
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  String leftDiceImage = 'images/dice1.png';
  String rightDiceImage = 'images/dice1.png';

  void rollBothDice() {
    setState(() {
      leftDiceImage = getRandomImageUrl();
      rightDiceImage = getRandomImageUrl();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () => rollBothDice(),
              child: Image.asset(leftDiceImage),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () => rollBothDice(),
              child: Image.asset(rightDiceImage),
            ),
          ),
        ],
      ),
    );
  }
}
