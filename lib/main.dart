import 'package:flutter/material.dart';
import 'package:learn_flutter_by_examples/data.dart';
import 'package:fluttertoast/fluttertoast.dart';

QuizBrain quizBrain = QuizBrain();

// class QuizApp extends StatelessWidget {
//   const QuizApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'QuizzApp',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
//       home: Scaffold(
//         appBar: AppBar(title: Text('QuizzApp')),
//         backgroundColor: Colors.grey.shade900,
//         body: SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 child: Text(
//                   '1. What is the capital of India?',
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      // Check if it's the last question BEFORE moving forward
      if (quizBrain.isFinished()) {
        Fluttertoast.showToast(
          msg: "Quiz Finished!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
        );
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizzApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: Text('QuizzApp')),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    quizBrain.getQuestionText(),
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.green,
                        height: 50,
                        child: TextButton(
                          onPressed: () => checkAnswer(true),
                          child: Text(
                            'True',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // 👈 space between
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        height: 50,
                        child: TextButton(
                          onPressed: () => checkAnswer(false),
                          child: Text(
                            'False',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(children: scoreKeeper),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(QuizApp());
  // runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: InputListScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class InputListScreen extends StatefulWidget {
//   @override
//   _InputListScreenState createState() => _InputListScreenState();
// }

// class _InputListScreenState extends State<InputListScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<String> _items = [];

//   void _addItem() {
//     if (_controller.text.trim().isEmpty) return;

//     setState(() {
//       _items.add(_controller.text.trim());
//       _controller.clear();
//     });
//   }

//   void _removeItem(String name) {
//     setState(() {
//       _items.remove(name);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Input Submit Example')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Input field
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 labelText: 'Enter text',
//                 border: OutlineInputBorder(),
//               ),
//             ),

//             SizedBox(height: 12),

//             // Submit button
//             OutlinedButton(
//               style: ButtonStyle(
//                 padding: WidgetStateProperty.all(
//                   EdgeInsets.symmetric(vertical: 14, horizontal: 20),
//                 ),
//               ),
//               onPressed: _addItem,
//               child: Text('Submit'),
//             ),

//             SizedBox(height: 20),

//             // Display list below
//             Expanded(
//               child: _items.isEmpty
//                   ? Center(child: Text('No data yet'))
//                   : ListView.builder(
//                       itemCount: _items.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           child: ListTile(
//                             title: Text(_items[index]),
//                             trailing: IconButton(
//                               color: Colors.red,
//                               icon: Icon(Icons.delete),
//                               onPressed: () => _removeItem(_items[index]),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
