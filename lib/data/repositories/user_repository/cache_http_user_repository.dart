import 'dart:io';
import 'dart:convert';
import 'package:clean_architecture/domain/entities/data_cache_entity.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/domain/repositories/abstract_user_repository.dart';
import 'package:localstorage/localstorage.dart';

class CacheHttpUserRepository extends AbstractUserRepository {
  final HttpClient httpClient;
  final LocalStorage? localStorage;

  CacheHttpUserRepository({
    required this.httpClient,
    this.localStorage,
  });

  @override
  Future<List<UserEntity>>? getUsers() {
    if (localStorage != null) {
      var users = localStorage?.getItem('users');
      if (users != null) {
        users = DataCacheEntity.fromJson(users).data;
        return Future.value(json.decode(users) as List<dynamic>).then(
          (users) => users.map((user) => UserEntity.fromMap(user)).toList(),
        );
      }
    }

    Future<List<UserEntity>>? futureListUserEntity = httpClient
        .getUrl(Uri.parse('http://jsonplaceholder.typicode.com/users'))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      return response.transform(utf8.decoder).join();
    }).then((String string) {
      if (localStorage != null) {
        DataCacheEntity dataCacheEntity = DataCacheEntity(data: string);
        localStorage?.setItem('users', dataCacheEntity);
      }
      return json
          .decode(string)
          .map<UserEntity>((json) => UserEntity.fromMap(json))
          .toList() as List<UserEntity>;
    });

    return futureListUserEntity;
  }

  @override
  Future<List<UserEntity>>? getUsersByName({
    required String userName,
  }) {
    if (localStorage != null) {
      var users = localStorage?.getItem('users');
      if (users != null) {
        users = DataCacheEntity.fromJson(users).data;
        return Future.value(json.decode(users) as List<dynamic>).then(
          (users) => users
              .where((user) {
                UserEntity userEntity = UserEntity.fromMap(user);
                RegExp regExp = RegExp(userName, caseSensitive: false);
                if (regExp.hasMatch('${userEntity.name}')) return true;
                return false;
              })
              .map((user) => UserEntity.fromMap(user))
              .toList(),
        );
      }
    }

    Future<List<UserEntity>>? futureListUserEntity = httpClient
        .getUrl(Uri.parse('http://jsonplaceholder.typicode.com/users'))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      return response.transform(utf8.decoder).join();
    }).then((String string) {
      return json.decode(string).map<UserEntity>((json) {
        if (localStorage != null) {
          DataCacheEntity dataCacheEntity = DataCacheEntity(data: string);
          localStorage?.setItem('users', dataCacheEntity);
        }
        UserEntity userEntity = UserEntity.fromMap(json);
        RegExp regExp = RegExp(userName);
        if (regExp.hasMatch('${userEntity.name}') == true) return userEntity;
        return null;
      }).toList() as List<UserEntity>;
    });

    return futureListUserEntity;
  }

  @override
  Future<UserEntity>? getUser({
    required int userId,
  }) {
    if (localStorage != null) {
      var users = localStorage?.getItem('users');
      if (users != null) {
        users = DataCacheEntity.fromJson(users).data;
        return Future.value(json.decode(users) as List<dynamic>).then(
          (users) => users
              .where((user) {
                UserEntity userEntity = UserEntity.fromMap(user);
                if (userEntity.id == userId) return true;
                return false;
              })
              .map((user) => UserEntity.fromMap(user))
              .toList()
              .first,
        );
      }
    }
    Future<UserEntity>? futureUserEntity = httpClient
        .getUrl(Uri.parse(
            'https://jsonplaceholder.typicode.com/users?userId=$userId'))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      UserEntity userEntity = UserEntity(id: userId);
      return userEntity;
    });
    return futureUserEntity;
  }
}
