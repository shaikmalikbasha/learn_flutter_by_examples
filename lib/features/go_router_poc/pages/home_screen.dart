import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_flutter_by_examples/features/go_router_poc/config/route_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('HomeScreen'),
        elevation: 5.0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Navigate to the profile screen
                  print('Navigating to Profile Screen');
                  GoRouter.of(context).pushNamed(
                    RouterConfigConstants.profile.name,
                    pathParameters: {"name": "IAMPATH"},
                    queryParameters: {"name": "Malik"},
                  );
                },
                label: Text('Profile'),
              ),
              TextButton.icon(
                icon: Icon(Icons.info),
                onPressed: () {
                  // Navigate to the about screen
                  print('Navigating to About Page');
                  GoRouter.of(
                    context,
                  ).pushNamed(RouterConfigConstants.about.name);
                },
                label: Text('About Us'),
              ),
              TextButton.icon(
                icon: Icon(Icons.contact_mail),
                onPressed: () {
                  // Navigate to the contact screen
                  print('Navigating to Contact Page');
                  GoRouter.of(
                    context,
                  ).pushNamed(RouterConfigConstants.contact.name);
                },
                label: Text('Contact Us'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
