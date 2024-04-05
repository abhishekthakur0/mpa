import 'auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignIn>((event, emit) {
      emit(AuthLoading());
      emit(AuthSuccess());
    });
    on<AuthSignOut>((event, emit) {
      emit(AuthLoading());
      emit(AuthFailure());
    });
  }
}
