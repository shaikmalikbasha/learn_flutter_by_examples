import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_flutter_by_examples/features/go_router_poc/config/route_constants.dart';
import 'package:learn_flutter_by_examples/features/go_router_poc/pages/about_us_screen.dart';
import 'package:learn_flutter_by_examples/features/go_router_poc/pages/contact_us_screen.dart';
import 'package:learn_flutter_by_examples/features/go_router_poc/pages/home_screen.dart';
import 'package:learn_flutter_by_examples/features/go_router_poc/pages/not_found_screen.dart';
import 'package:learn_flutter_by_examples/features/go_router_poc/pages/profile_screen.dart';

class MyAppRouterConfig {
  GoRouter get router => GoRouter(
    routes: [
      // Define your routes here
      GoRoute(
        name: RouterConfigConstants.home.name,
        path: RouterConfigConstants.home.path,
        pageBuilder: (context, state) => MaterialPage(child: HomeScreen()),
      ),
      GoRoute(
        name: RouterConfigConstants.profile.name,
        path: RouterConfigConstants.profile.path,
        pageBuilder: (context, state) =>
            MaterialPage(child: ProfilePage(name: '')),
      ),
      GoRoute(
        name: RouterConfigConstants.about.name,
        path: RouterConfigConstants.about.path,
        pageBuilder: (context, state) => MaterialPage(child: AboutUsScreen()),
      ),
      GoRoute(
        name: RouterConfigConstants.contact.name,
        path: RouterConfigConstants.contact.path,
        pageBuilder: (context, state) => MaterialPage(child: ContactUsScreen()),
      ),
    ],
    errorBuilder: (context, state) {
      return NotFoundPage();
    },
  );

  MyAppRouterConfig();
}
