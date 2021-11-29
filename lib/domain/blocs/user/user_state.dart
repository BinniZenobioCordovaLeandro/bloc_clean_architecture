part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserEntity userEntity;

  UserLoaded({
    required this.userEntity,
  });
}

class ListUsersLoaded extends UserState {
  final List<UserEntity>? listUserEntities;

  ListUsersLoaded({
    required this.listUserEntities,
  });
}

class UserError extends UserState {
  final String error;

  UserError({
    required this.error,
  });
}
