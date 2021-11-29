import 'dart:convert';
import 'dart:io';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/domain/repositories/abstract_user_repository.dart';

class HttpUserRepository extends AbstractUserRepository {
  final HttpClient httpClient;

  HttpUserRepository({
    required this.httpClient,
  });

  @override
  Future<List<UserEntity>>? getUsers() {
    Future<List<UserEntity>>? futureListUserEntity = httpClient
        .getUrl(Uri.parse('http://jsonplaceholder.typicode.com/users'))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      return response.transform(utf8.decoder).join();
    }).then((String string) {
      return json.decode(string).map<UserEntity>((json) {
        return UserEntity.fromMap(json);
      }).toList() as List<UserEntity>;
    });

    return futureListUserEntity;
  }

  @override
  Future<List<UserEntity>>? getUsersByName({
    required String userName,
  }) {
    Future<List<UserEntity>>? futureListUserEntity = httpClient
        .getUrl(Uri.parse(
            'https://jsonplaceholder.typicode.com/users??userNameLike=$userName'))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      List<UserEntity> listUserEntity = [] as List<UserEntity>;
      return listUserEntity;
    });
    return futureListUserEntity;
  }

  @override
  Future<UserEntity>? getUser({
    required int userId,
  }) {
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
