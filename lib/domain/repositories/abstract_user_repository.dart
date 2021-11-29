import 'package:clean_architecture/domain/entities/user_entity.dart';

abstract class AbstractUserRepository {
  Future<List<UserEntity>>? getUsers();

  Future<List<UserEntity>>? getUsersByName({
    required String userName,
  });

  Future<UserEntity>? getUser({
    required int userId,
  });
}
