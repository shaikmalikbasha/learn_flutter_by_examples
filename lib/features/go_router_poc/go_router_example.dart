import 'package:flutter/material.dart';
import 'package:learn_flutter_by_examples/features/go_router_poc/config/route_config.dart';

class GoRouterExample extends StatelessWidget {
  const GoRouterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'GoRouter',
      // routeInformationParser: MyAppRouterConfig().router.routeInformationParser,
      // routerDelegate: MyAppRouterConfig().router.routerDelegate,
      routerConfig: MyAppRouterConfig().router,
    );
  }
}
