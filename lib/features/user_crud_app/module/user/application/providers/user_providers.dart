import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter_by_examples/features/user_crud_app/module/user/data/datasources/user_local_datasource.dart';
import 'package:learn_flutter_by_examples/features/user_crud_app/module/user/data/repositories/user_repository_impl.dart';
import 'package:learn_flutter_by_examples/features/user_crud_app/module/user/domain/repositories/user.dart';

final userLocalDataSourceProvider = Provider((ref) {
  // return UserLocalDataSource();
  return UserLocalDataSource();
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final ds = ref.watch(userLocalDataSourceProvider);
  return UserRepositoryImpl(ds);
});
