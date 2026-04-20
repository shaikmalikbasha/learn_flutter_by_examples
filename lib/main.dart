import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Mi Card App',
//       home: Scaffold(
//         backgroundColor: Colors.teal,
//         // appBar: AppBar(backgroundColor: Colors.white, title: Text('MiCardApp')),
//         body: SafeArea(
//           child: Column(
//             // mainAxisSize: MainAxisSize.min,
//             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Container(
//                 color: Colors.white,
//                 // margin: EdgeInsets.all(50.0),
//                 // padding: EdgeInsets.all(20.0),
//                 height: 100.0,
//                 width: 100.0,
//                 child: Text('Container-1\n(100x100)'),
//               ),
//               SizedBox(height: 10.0),
//               Container(
//                 width: 100.0,
//                 height: 100.0,
//                 color: Colors.blue,
//                 child: Text('Container-2\n(100x100)'),
//               ),
//               Container(
//                 width: 100.0,
//                 height: 100.0,
//                 color: Colors.red,
//                 child: Text('Container-3\n(100x100)'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Mi Card App',
//       home: Scaffold(
//         backgroundColor: Colors.teal[900],
//         body: SafeArea(
//           child: Column(
//             children: [
//               CircleAvatar(
//                 radius: 50.0,
//                 backgroundImage: AssetImage('images/malik-shaik-icon.png'),
//               ),
//               Text(
//                 'Maik Shaik',
//                 style: TextStyle(
//                   fontSize: 40.0,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Pacifico',
//                 ),
//               ),
//               Text(
//                 '@itz_me_mr_developer',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   color: Colors.teal[100],
//                   letterSpacing: 2.5,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Container(
//                 color: Colors.white,
//                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                 padding: EdgeInsets.all(10.0),
//                 child: Row(
//                   children: <Widget>[
//                     Icon(Icons.phone, color: Colors.teal.shade900),
//                     SizedBox(width: 10.0),
//                     Text(
//                       '+91 1234567890',
//                       style: TextStyle(
//                         color: Colors.teal.shade900,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // SizedBox(height: 10.0),
//               Container(
//                 color: Colors.white,
//                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                 padding: EdgeInsets.all(10.0),
//                 child: Row(
//                   children: <Widget>[
//                     Icon(Icons.email, color: Colors.teal.shade900),
//                     SizedBox(width: 10.0),
//                     Text(
//                       'malik.shaik@example.com',
//                       style: TextStyle(
//                         color: Colors.teal.shade900,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/// Method - 2: Using CardTile widget inside Card widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Card App',
      home: Scaffold(
        backgroundColor: Colors.teal[900],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/malik-shaik-icon.png'),
              ),
              Text(
                'Maik Shaik',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                '@itz_me_mr_developer',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.teal[100],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(color: Colors.teal.shade100),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.teal.shade900),
                  title: Text(
                    '+91 1234567890',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.cancel, color: Colors.red),
                ),
              ),
              // SizedBox(height: 10.0),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.teal.shade900),
                  title: Text(
                    'malik.shaik@example.com',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.cancel, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
