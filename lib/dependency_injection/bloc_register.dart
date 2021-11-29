import 'package:clean_architecture/dependency_injection/repositories_register.dart';
import 'package:clean_architecture/domain/blocs/user/user_bloc.dart';
import 'package:clean_architecture/domain/repositories/abstract_login_repository.dart';
import 'package:clean_architecture/domain/repositories/abstract_user_repository.dart';
import 'package:injector/injector.dart';
import 'package:clean_architecture/domain/blocs/auth/auth_bloc.dart';

class BlocRegister {
  final injector = Injector.appInstance;

  BlocRegister() {
    RepositoriesRegister();
    injector.registerSingleton<AuthBloc>(() {
      return AuthBloc(
        abstractLoginRepository: injector.get<AbstractLoginRepository>(),
      );
    });
    injector.registerSingleton<UserBloc>(() {
      return UserBloc(
        abstractUserRepository: injector.get<AbstractUserRepository>(),
      );
    });
  }
}
