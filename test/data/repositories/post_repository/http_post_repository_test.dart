import 'dart:io';
import 'package:clean_architecture/data/repositories/post_repository/cache_http_post_repository.dart';
import 'package:clean_architecture/data/repositories/post_repository/mock_http_post_repository.dart';
import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  final MockHttpPostRepository mockHttpPostRepository =
      MockHttpPostRepository();

  test('should return a list of posts', () async {
    CacheHttpPostRepository cacheHttpUserRepository = CacheHttpPostRepository(
      httpClient: HttpClient(),
    );

    expect(
      await cacheHttpUserRepository.getPosts(),
      isInstanceOf<List<PostEntity>>(),
    );
  });

  test('should return a list of posts from user', () async {
    CacheHttpPostRepository cacheHttpUserRepository = CacheHttpPostRepository(
      httpClient: HttpClient(),
    );

    expect(
      await cacheHttpUserRepository.getPostsByUserId(
        userId: 1,
      ),
      isInstanceOf<List<PostEntity>>(),
    );
  });

  test('should return a list of posts from user with cache', () async {
    CacheHttpPostRepository cacheHttpUserRepository = CacheHttpPostRepository(
      httpClient: HttpClient(),
      localStorage: LocalStorage('cache_posts_test'),
    );

    expect(
      await cacheHttpUserRepository.getPostsByUserId(
        userId: 1,
      ),
      isInstanceOf<List<PostEntity>>(),
    );

    expect(
      await cacheHttpUserRepository.getPostsByUserId(
        userId: 1,
      ),
      isInstanceOf<List<PostEntity>>(),
    );
  });
}
