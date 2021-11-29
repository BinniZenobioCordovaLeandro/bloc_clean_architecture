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
    print(event);
    if (event is UserEventFetchList) {
      yield UserLoading();
      try {
        final List<UserEntity>? listUserEntity =
            await abstractUserRepository.getUsers();

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
