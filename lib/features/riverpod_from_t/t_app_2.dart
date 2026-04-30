import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((Ref ref) {
  return 0;
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
    print('Build Method Re-Rendered');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          print('Consumer Method Re-Rendered');
          final counter = ref.watch(counterProvider).toString();
          return Center(child: Text(counter));
        },
      ),
    );
  }
}
