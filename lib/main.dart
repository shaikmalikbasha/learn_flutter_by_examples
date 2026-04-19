import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I am Rich',
      home: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text('I am Rich'),
        ),
        body: Center(child: Image(image: AssetImage('images/school-icon.png'))),
      ),
    ),
  );
}
