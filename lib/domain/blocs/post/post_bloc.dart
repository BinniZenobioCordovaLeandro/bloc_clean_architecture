import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/domain/repositories/abstract_post_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final AbstractPostRepository abstractPostRepository;

  PostBloc({
    required this.abstractPostRepository,
  }) : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is PostEventFetchListByUserId) {
      yield PostLoading();
      try {
        final List<PostEntity>? listPostEntity;
        if (event.userId != null) {
          listPostEntity = await abstractPostRepository.getPostsByUserId(
            userId: event.userId!,
          );
        } else {
          listPostEntity = await abstractPostRepository.getPosts();
        }
        yield ListPostsLoaded(
          postEntities: listPostEntity,
        );
      } catch (e) {
        yield PostError(message: e.toString());
      }
    }
  }
}
