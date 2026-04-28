import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  const ProfilePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text('ProfilePage'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'ProfilePage',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          Text(''),
        ],
      ),
    );
  }
}
