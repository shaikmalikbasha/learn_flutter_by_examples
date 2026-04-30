import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter_by_examples/features/riverpod_from_t/fake_api_data.dart';

final tickerStreamProvider = StreamProvider((Ref ref) {
  // return ref.read(apiServiceProvider).tick();
  return ref.read(apiServiceProvider).tickWithError();
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
    final tickAsync = ref.watch(tickerStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamTicks'),
        backgroundColor: Colors.transparent,
        elevation: 2.0,
      ),

      body: Center(
        child: tickAsync.when(
          skipLoadingOnRefresh: false,
          data: (tick) =>
              Text('Seconds Elapsed: $tick', style: TextStyle(fontSize: 30.0)),
          error: (error, stackTrace) {
            return Column(
              children: [
                Text(error.toString()),
                SizedBox(height: 10.0),
                TextButton(
                  onPressed: () => ref.refresh(tickerStreamProvider),
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
