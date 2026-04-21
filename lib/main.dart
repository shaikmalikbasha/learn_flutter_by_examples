import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(XylophoneApp());
}

// class XylophoneApp extends StatelessWidget {
//   XylophoneApp({super.key});

//   final player = AudioPlayer();

//   void playSound(String soundFile) async {
//     await player.play(AssetSource(soundFile));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Xylophone',
//       home: Scaffold(
//         backgroundColor: Colors.grey[350],
//         appBar: AppBar(title: const Text('Xylophone'), elevation: 4.0),
//         body: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.zero,
//                       ),
//                     ),
//                     onPressed: () {
//                       playSound('note1.wav');
//                     },
//                     child: const SizedBox.shrink(), // no text
//                   ),
//                 ),
//               ),

//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.orange,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.zero,
//                       ),
//                     ),
//                     onPressed: () {
//                       playSound('note2.wav');
//                     },
//                     child: const SizedBox.shrink(),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.yellow,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.zero,
//                       ),
//                     ),
//                     onPressed: () {
//                       playSound('note3.wav');
//                     },
//                     child: const SizedBox.shrink(),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.zero,
//                       ),
//                     ),
//                     onPressed: () {
//                       playSound('note4.wav');
//                     },
//                     child: const SizedBox.shrink(),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.teal,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.zero,
//                       ),
//                     ),
//                     onPressed: () {
//                       playSound('note5.wav');
//                     },
//                     child: const SizedBox.shrink(),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.purple,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.zero,
//                       ),
//                     ),
//                     onPressed: () {
//                       playSound('note6.wav');
//                     },
//                     child: const SizedBox.shrink(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/// Method - 2; Using the For Loop
class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});
  final player = AudioPlayer();
  final List<Map<String, dynamic>> notes = [
    {'color': Colors.red, 'filePath': 'note1.wav'},
    {'color': Colors.orange, 'filePath': 'note2.wav'},
    {'color': Colors.yellow, 'filePath': 'note3.wav'},
    {'color': Colors.green, 'filePath': 'note4.wav'},
    {'color': Colors.teal, 'filePath': 'note5.wav'},
    {'color': Colors.blue, 'filePath': 'note6.wav'},
    {'color': Colors.purple, 'filePath': 'note7.wav'},
  ];

  void playSound(String soundFile) async {
    await player.play(AssetSource(soundFile));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone',
      home: Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(title: const Text('Xylophone'), elevation: 4.0),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var note in notes)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: note['color'],
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () {
                        playSound(note['filePath']);
                      },
                      child: const SizedBox.shrink(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
