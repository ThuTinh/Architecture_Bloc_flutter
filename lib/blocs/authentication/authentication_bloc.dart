import 'package:bloc/bloc.dart';
import 'package:demo_bloc/repositories/loginRepository/login_repository.dart';
import 'package:demo_bloc/services/sevice_locator.dart';
import 'package:equatable/equatable.dart';
part 'authentication_state.dart';
part 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  LoginRepository loginRepository = serviceLocator<LoginRepository>();

  AuthenticationBloc() : super(AuthenticationUnauthenticated());

  AuthenticationState get initialState => AuthenticationUnauthenticated();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStart) {
      final bool hasToken = await loginRepository.hasToken();
      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }
    if (event is LoggedIn) {
      final bool token = await loginRepository.hasToken();
      if (token) {
        Future.delayed(
          const Duration(milliseconds: 1000),
        );
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }
    if (event is Login) {
      yield AuthenticationIntialized();
    }
    if (event is LogOut) {
      yield AuthenticationLoading();
      yield AuthenticationUnauthenticated();
    }
  }
}
