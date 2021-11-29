import 'package:clean_architecture/domain/entities/user_entity.dart';

abstract class AbstractLoginRepository {
  Future<UserEntity> doLogin({
    required String username,
    required String password,
  });

  Future<void> doLogout();
}
