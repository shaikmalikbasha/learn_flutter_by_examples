import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter_by_examples/features/user_crud_app/module/user/application/controller/user_controller.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  void _showAddUserDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add User"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text.trim();
                String email = emailController.text.trim();

                // addUser(name, email); // 🔥 Your function call
                ref.read(userControllerProvider.notifier).addUser(name, email);

                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(userControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: usersAsync.when(
        data: (users) => ListView.builder(
          itemCount: users.length,
          itemBuilder: (_, i) {
            final user = users[i];
            return ListTile(
              key: ValueKey(user.id),
              title: Text(user.name),
              subtitle: Text(user.email),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  ref.read(userControllerProvider.notifier).deleteUser(user.id);
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref
          //     .read(userControllerProvider.notifier)
          //     .addUser("John Doe", "john@mail.com");
          _showAddUserDialog(context, ref);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
