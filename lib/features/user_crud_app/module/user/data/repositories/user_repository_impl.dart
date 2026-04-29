import 'package:learn_flutter_by_examples/features/user_crud_app/module/user/data/datasources/user_local_datasource.dart';
import 'package:learn_flutter_by_examples/features/user_crud_app/module/user/data/models/user_model.dart';
import 'package:learn_flutter_by_examples/features/user_crud_app/module/user/domain/entities/user.dart';
import 'package:learn_flutter_by_examples/features/user_crud_app/module/user/domain/repositories/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl(this.localDataSource);

  @override
  Future<List<User>> getUsers() async {
    return await localDataSource.getUsers();
  }

  @override
  Future<void> addUser(User user) async {
    await localDataSource.addUser(
      UserModel(id: user.id, name: user.name, email: user.email),
    );
  }

  @override
  Future<void> updateUser(User user) async {
    await localDataSource.updateUser(
      UserModel(id: user.id, name: user.name, email: user.email),
    );
  }

  @override
  Future<void> deleteUser(String id) async {
    await localDataSource.deleteUser(id);
  }
}
