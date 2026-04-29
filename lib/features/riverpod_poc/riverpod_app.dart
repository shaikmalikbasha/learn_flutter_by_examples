import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter_by_examples/features/riverpod_poc/counter_provider.dart';

class MyRiverPodApp extends StatelessWidget {
  const MyRiverPodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RiverPodApp',
      home: HardPage(),
      // home: EasyPage(),
    );
  }
}

class EasyPage extends ConsumerWidget {
  EasyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF6A88), Color(0xFFFF99AC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Text('RiverPod Example', style: TextStyle(fontSize: 30.0)),
            Text(
              ref.watch(easyCounterProvider).toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    ref.read(easyCounterProvider.notifier).state++;
                  },
                  alignment: Alignment.center,
                  splashColor: Colors.green,
                  icon: Icon(Icons.add, size: 100.0, color: Colors.green[900]),
                ),
                SizedBox(width: 100.0),

                IconButton(
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    ref.read(easyCounterProvider.notifier).state--;
                  },
                  alignment: Alignment.center,
                  splashColor: Colors.red,
                  icon: Icon(Icons.delete, size: 100.0, color: Colors.red[900]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HardPage extends ConsumerWidget {
  HardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF6A88), Color(0xFFFF99AC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Text('RiverPod Example', style: TextStyle(fontSize: 30.0)),
            Text(
              ref.watch(hardCounterProvider).counter.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    ref.read(hardCounterProvider).addCounter();
                  },
                  alignment: Alignment.center,
                  splashColor: Colors.green,
                  icon: Icon(Icons.add, size: 100.0, color: Colors.green[900]),
                ),
                SizedBox(width: 100.0),

                IconButton(
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    ref.read(hardCounterProvider).removeCounter();
                  },
                  alignment: Alignment.center,
                  splashColor: Colors.red,
                  icon: Icon(Icons.remove, size: 100.0, color: Colors.red[900]),
                ),
              ],
            ),
            IconButton(
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                ref.read(hardCounterProvider).resetCounter();
              },
              alignment: Alignment.center,
              splashColor: Colors.green,
              icon: Icon(Icons.restore, size: 100.0, color: Colors.blue[900]),
            ),
          ],
        ),
      ),
    );
  }
}
