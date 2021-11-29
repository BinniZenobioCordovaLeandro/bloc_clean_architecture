import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain/repositories/abstract_login_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AbstractLoginRepository abstractLoginRepository;

  AuthBloc({
    required this.abstractLoginRepository,
  }) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    // TODO: implement mapEventToState
  }
}
