import 'package:clean_architecture/domain/entities/post_entity.dart';

abstract class AbstractPostRepository {
  Future<List<PostEntity>>? getPosts();

  Future<List<PostEntity>>? getPostsByUserId({
    required int userId,
  });

  Future<PostEntity>? getPost({
    required int postId,
  });
}
