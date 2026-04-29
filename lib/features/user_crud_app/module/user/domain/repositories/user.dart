import 'package:learn_flutter_by_examples/features/user_crud_app/module/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
  Future<void> addUser(User user);
  Future<void> updateUser(User user);
  Future<void> deleteUser(String id);
}
