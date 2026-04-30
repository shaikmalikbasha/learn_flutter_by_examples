import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  Future<String> getGreetings() async {
    await Future.delayed(Duration(seconds: 5));
    if (Random().nextDouble() < 0.3) {
      throw Exception('Error Occured while fetching the data');
    }
    return 'Hey, I am API Data';
  }

  Stream<int> tick() {
    return Stream.periodic(const Duration(seconds: 1), (count) => count);
  }

  Stream<int> tickWithError() async* {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
    throw Exception("Exception raised");
  }
}

final apiServiceProvider = Provider((_) => ApiService());
