import 'package:hive/hive.dart';
import '../models/user_model.dart';

class UserLocalDataSource {
  static const boxName = "users";

  Future<Box> _openBox() async {
    return await Hive.openBox(boxName);
  }

  Future<List<UserModel>> getUsers() async {
    final box = await _openBox();
    return box.values
        .map((e) => UserModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> addUser(UserModel user) async {
    final box = await _openBox();
    await box.put(user.id, user.toJson());
  }

  Future<void> updateUser(UserModel user) async {
    final box = await _openBox();
    await box.put(user.id, user.toJson());
  }

  Future<void> deleteUser(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }
}
