import 'dart:io';

import 'package:clean_architecture/data/repositories/login/http_login_repository.dart';
import 'package:clean_architecture/data/repositories/post_repository/cache_http_post_repository.dart';
import 'package:clean_architecture/data/repositories/user_repository/cache_http_user_repository.dart';
import 'package:clean_architecture/domain/repositories/abstract_login_repository.dart';
import 'package:clean_architecture/domain/repositories/abstract_post_repository.dart';
import 'package:clean_architecture/domain/repositories/abstract_user_repository.dart';
import 'package:injector/injector.dart';
import 'package:localstorage/localstorage.dart';

class RepositoriesRegister {
  final injector = Injector.appInstance;

  RepositoriesRegister() {
    injector.registerDependency<AbstractLoginRepository>(() {
      return HttpLoginRepository();
    });
    injector.registerDependency<AbstractUserRepository>(() {
      return CacheHttpUserRepository(
        httpClient: HttpClient(),
        localStorage: LocalStorage('cache_users'),
      );
    });
    injector.registerDependency<AbstractPostRepository>(() {
      return CacheHttpPostRepository(
        httpClient: HttpClient(),
        localStorage: LocalStorage('cache_posts'),
      );
    });
  }
}
