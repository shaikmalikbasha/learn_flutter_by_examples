import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staticStringProvider = Provider((Ref ref) {
  return 'Hello World';
});

class MyRiverPodAppFromT extends StatelessWidget {
  const MyRiverPodAppFromT({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'App', home: MyRiverPodAppExample());
  }
}

class MyRiverPodAppExample extends ConsumerWidget {
  const MyRiverPodAppExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String textData = ref.watch(staticStringProvider);
    return Scaffold(body: Center(child: Text(textData)));
  }
}
