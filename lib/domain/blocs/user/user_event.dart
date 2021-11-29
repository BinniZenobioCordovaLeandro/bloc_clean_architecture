part of 'user_bloc.dart';

@immutable
abstract class UserEvent {
  const UserEvent();
}

class UserEventFetchList extends UserEvent {
  final String? userName;
  const UserEventFetchList({this.userName});

  @override
  List<Object?> get props => [userName];
}
