part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class PostEventFetchListByUserId extends PostEvent {
  final int? userId;

  PostEventFetchListByUserId({
    required this.userId,
  });

  @override
  List<Object?> get props => [userId];
}
