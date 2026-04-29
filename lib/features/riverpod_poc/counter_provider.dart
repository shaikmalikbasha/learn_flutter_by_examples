import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter_by_examples/features/riverpod_poc/riverpod_model.dart';

final easyCounterProvider = StateProvider<int>((ref) {
  return 0;
});

final hardCounterProvider = ChangeNotifierProvider<RiverpodModel>((ref) {
  return RiverpodModel(counter: 0);
});
