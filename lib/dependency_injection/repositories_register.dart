import 'dart:io';

import 'package:clean_architecture/data/repositories/login/http_login_repository.dart';
import 'package:clean_architecture/data/repositories/user/http_user_repository.dart';
import 'package:clean_architecture/domain/repositories/abstract_login_repository.dart';
import 'package:clean_architecture/domain/repositories/abstract_user_repository.dart';
import 'package:injector/injector.dart';

class RepositoriesRegister {
  final injector = Injector.appInstance;

  RepositoriesRegister() {
    injector.registerDependency<AbstractLoginRepository>(() {
      return HttpLoginRepository();
    });
    injector.registerDependency<AbstractUserRepository>(() {
      return HttpUserRepository(
        httpClient: HttpClient(),
      );
    });
  }
}
