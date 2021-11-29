import 'dart:convert';
import 'dart:io';

import 'package:clean_architecture/domain/entities/data_cache_entity.dart';
import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/domain/repositories/abstract_post_repository.dart';
import 'package:localstorage/localstorage.dart';

class CacheHttpPostRepository extends AbstractPostRepository {
  final HttpClient httpClient;
  final LocalStorage? localStorage;

  CacheHttpPostRepository({
    required this.httpClient,
    this.localStorage,
  });

  @override
  Future<List<PostEntity>>? getPosts() async {
    if (localStorage != null) {
      var posts = localStorage?.getItem('posts');
      if (posts != null) {
        posts = DataCacheEntity.fromJson(posts).data;
        return Future.value(json.decode(posts) as List<dynamic>).then(
          (json) => json.map((json) => PostEntity.fromMap(json)).toList(),
        );
      }
    }
    Future<List<PostEntity>>? futureListPostEntity = httpClient
        .getUrl(Uri.parse('http://jsonplaceholder.typicode.com/posts'))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      return response.transform(utf8.decoder).join();
    }).then((String string) {
      if (localStorage != null) {
        DataCacheEntity dataCacheEntity = DataCacheEntity(data: string);
        localStorage?.setItem('posts', dataCacheEntity);
      }
      return json
          .decode(string)
          .map((post) => PostEntity.fromMap(post))
          .toList() as List<PostEntity>;
    });

    return futureListPostEntity;
  }

  @override
  Future<List<PostEntity>>? getPostsByUserId({required int userId}) {
    if (localStorage != null) {
      var posts = localStorage?.getItem('posts');
      if (posts != null) {
        posts = DataCacheEntity.fromJson(posts).data;
      } else {
        posts = localStorage?.getItem('posts_$userId');
        if (posts != null) posts = DataCacheEntity.fromJson(posts).data;
      }
      if (posts != null) {
        return Future.value(json.decode(posts) as List<dynamic>).then(
          (json) => json
              .map((json) => PostEntity.fromMap(json))
              .where((post) => post.userId == userId)
              .toList(),
        );
      }
    }
    Future<List<PostEntity>>? futureListPostEntity = httpClient
        .getUrl(Uri.parse(
            'http://jsonplaceholder.typicode.com/posts?userId=$userId'))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      return response.transform(utf8.decoder).join();
    }).then((String string) {
      if (localStorage != null) {
        DataCacheEntity dataCacheEntity = DataCacheEntity(data: string);
        localStorage?.setItem('posts_$userId', dataCacheEntity);
      }
      return json
          .decode(string)
          .map<PostEntity>((post) => PostEntity.fromMap(post))
          .toList() as List<PostEntity>;
    });

    return futureListPostEntity;
  }

  @override
  Future<PostEntity>? getPost({required int postId}) {
    throw UnimplementedError();
  }
}
