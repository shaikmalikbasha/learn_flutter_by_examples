import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter_by_examples/features/riverpod_from_t/fake_api_data.dart';

final greetingsFutureProvider = FutureProvider((Ref ref) {
  return ref.read(apiServiceProvider).getGreetings();
});

class MyRiverPodAppFromT extends StatelessWidget {
  const MyRiverPodAppFromT({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyRiverPodAppExample());
  }
}

class MyRiverPodAppExample extends ConsumerWidget {
  const MyRiverPodAppExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingsAsync = ref.watch(greetingsFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('FutureAsync'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: greetingsAsync.when(
          skipLoadingOnRefresh: false,
          data: (greeting) => Text(greeting, style: TextStyle(fontSize: 30.0)),
          error: (error, stackTrace) {
            return Column(
              children: [
                Text(error.toString()),
                SizedBox(height: 10.0),
                TextButton(
                  onPressed: () => ref.refresh(greetingsFutureProvider),
                  child: Text('Retry'),
                ),
              ],
            );
          },
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
