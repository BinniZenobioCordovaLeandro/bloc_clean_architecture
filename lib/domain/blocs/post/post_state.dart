part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final PostEntity postEntity;

  PostLoaded({
    required this.postEntity,
  });
}

class ListPostsLoaded extends PostState {
  final List<PostEntity>? postEntities;

  ListPostsLoaded({
    required this.postEntities,
  });
}

class PostError extends PostState {
  final String message;

  PostError({
    required this.message,
  });
}
