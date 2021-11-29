import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/domain/repositories/abstract_login_repository.dart';

class FirebaseLoginRepository extends AbstractLoginRepository {
  // final FirebaseAuth _firebaseAuth;

  @override
  Future<UserEntity> doLogin({
    required String username,
    required String password,
  }) async {
    // final user = await _firebaseAuth.signInWithEmailAndPassword(
    //   email: username,
    //   password: password,
    // );
    return UserEntity(
      username: username,
    );
  }

  @override
  Future<void> doLogout() async {
    // _firebaseAuth.signOut();
  }
}
