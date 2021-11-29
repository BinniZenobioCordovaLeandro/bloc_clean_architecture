import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/domain/repositories/abstract_user_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AbstractUserRepository abstractUserRepository;

  UserBloc({
    required this.abstractUserRepository,
  }) : super(UserInitial());
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserFetch) {
      yield UserLoading();
      try {
        if (event.userId != null) {
          final UserEntity? userEntity = await abstractUserRepository.getUser(
            userId: event.userId!,
          );
          if (userEntity?.id != null) {
            yield UserLoaded(userEntity: userEntity!);
          } else {
            yield UserError(error: 'error');
          }
        }
      } catch (e) {
        yield UserError(error: e.toString());
      }
    }

    if (event is UserEventFetchList) {
      yield UserLoading();
      try {
        final List<UserEntity>? listUserEntity;
        if (event.userName != null) {
          listUserEntity = await abstractUserRepository.getUsersByName(
            userName: '${event.userName}',
          );
        } else {
          listUserEntity = await abstractUserRepository.getUsers();
        }
        yield ListUsersLoaded(
          listUserEntities: listUserEntity,
        );
      } catch (e) {
        yield UserError(
          error: e.toString(),
        );
      }
    }
  }
}
