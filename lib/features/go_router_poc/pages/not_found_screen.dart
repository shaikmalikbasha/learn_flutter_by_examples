import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_flutter_by_examples/features/go_router_poc/config/route_constants.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text('NotFoundPage'),
      ),
      body: Column(
        children: [
          Text(
            'NotFoundPage',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),

          Divider(height: 5.0),

          TextButton.icon(
            onPressed: () {
              GoRouter.of(context).pushNamed(RouterConfigConstants.home.name);
            },
            label: Text('Back to HOME '),
          ),
        ],
      ),
    );
  }
}
