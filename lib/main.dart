import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter_by_examples/features/riverpod_poc/riverpod_app.dart';
// import 'package:learn_flutter_by_examples/features/go_router_poc/pages/login.dart';
// import 'package:learn_flutter_by_examples/features/responsive_app_1/responsive_main.dart';
// import 'package:learn_flutter_by_examples/features/go_router_poc/go_router_example.dart';
// import 'package:learn_flutter_by_examples/features/scroll_poc/scroll_items.dart';
// import 'package:learn_flutter_by_examples/features/school_app_1/index.dart';

// void main() => runApp(GoRouterExample());

// void main() => runApp(InfiniteScrollApp());

// void main() => runApp(SchoolApp());

// void main() => runApp(LoginExampleApp());

// void main() => runApp(const MyResponsiveApp());

void main() => runApp(ProviderScope(child: MyRiverPodApp()));
