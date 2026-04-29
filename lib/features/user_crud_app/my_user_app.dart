import 'package:flutter/material.dart';
import 'package:learn_flutter_by_examples/features/user_crud_app/module/user/presentation/user_page.dart';

class MyUserCrudApp extends StatelessWidget {
  const MyUserCrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UserCrudApp',
      home: UserScreen(),
    );
  }
}
