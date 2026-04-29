import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter_by_examples/features/user_crud_app/module/user/application/providers/user_providers.dart';
import 'package:learn_flutter_by_examples/features/user_crud_app/module/user/domain/entities/user.dart';
import 'package:uuid/uuid.dart';

final userControllerProvider =
    AsyncNotifierProvider<UserController, List<User>>(UserController.new);

class UserController extends AsyncNotifier<List<User>> {
  late final repo = ref.read(userRepositoryProvider);

  @override
  Future<List<User>> build() async {
    Future.delayed(Duration(seconds: 5));
    print("Waiting....");
    return repo.getUsers();
  }

  Future<void> addUser(String name, String email) async {
    final user = User(id: const Uuid().v4(), name: name, email: email);

    state = const AsyncLoading();
    await repo.addUser(user);
    state = AsyncData(await repo.getUsers());
  }

  Future<void> deleteUser(String id) async {
    state = const AsyncLoading();
    await repo.deleteUser(id);
    state = AsyncData(await repo.getUsers());
  }
}
