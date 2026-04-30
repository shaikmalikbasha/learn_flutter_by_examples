import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = StateProvider((Ref ref) {
  return '';
});

class MyRiverPodAppFromT extends StatelessWidget {
  const MyRiverPodAppFromT({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyRiverPodAppExample());
  }
}

class MyRiverPodAppExample extends ConsumerStatefulWidget {
  const MyRiverPodAppExample({super.key});

  @override
  ConsumerState<MyRiverPodAppExample> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyRiverPodAppExample> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      ref.read(textProvider.notifier).state = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConsumerStatefulWidget'),
        backgroundColor: Colors.transparent,
        elevation: 1.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(controller: _controller),
              Text(ref.watch(textProvider)),
            ],
          ),
        ),
      ),
    );
  }
}
