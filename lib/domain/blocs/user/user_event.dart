part of 'user_bloc.dart';

@immutable
abstract class UserEvent {
  const UserEvent();
}

class UserFetch extends UserEvent {
  final int? userId;

  const UserFetch({
    required this.userId,
  });
}

class UserEventFetchList extends UserEvent {
  const UserEventFetchList();
}

class UserEventFetchListByName extends UserEvent {
  final String userName;

  const UserEventFetchListByName({
    required this.userName,
  });

  List<Object?> get props => [userName];
}
