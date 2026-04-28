import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  // const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text('AboutUsScreen'),
      ),
      body: Center(
        child: Text(
          'AboutUsScreen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
