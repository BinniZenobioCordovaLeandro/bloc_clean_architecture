import 'dart:io';
import 'package:clean_architecture/data/repositories/user_repository/cache_http_user_repository.dart';
import 'package:clean_architecture/data/repositories/user_repository/mock_http_user_repository.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  final MockHttpUserRepository mockHttpUserRepository =
      MockHttpUserRepository();

  test('should return a list of users', () async {
    CacheHttpUserRepository cacheHttpUserRepository = CacheHttpUserRepository(
      httpClient: HttpClient(),
    );

    expect(
      cacheHttpUserRepository.getUsers(),
      isInstanceOf<Future<List<UserEntity>>>(),
    );
  });

  test('should return a list of users from cache', () async {
    CacheHttpUserRepository cacheHttpUserRepository = CacheHttpUserRepository(
      httpClient: HttpClient(),
      localStorage: LocalStorage('cache_users_test'),
    );

    expect(
      cacheHttpUserRepository.getUsers(),
      isInstanceOf<Future<List<UserEntity>>>(),
    );
    expect(
      cacheHttpUserRepository.getUsers(),
      isInstanceOf<Future<List<UserEntity>>>(),
    );
  });
}
