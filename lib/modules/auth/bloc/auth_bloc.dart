import 'package:firebase_auth/firebase_auth.dart';

import 'auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String email = '';
  String password = '';

  AuthBloc() : super(AuthInitial()) {
    on<AuthEmailChanged>((event, emit) {
      email = event.email;
    });
    on<AuthPasswordChanged>((event, emit) {
      password = event.password;
    });
    on<AuthSignIn>((event, emit) async {
      emit(AuthLoading());
      try {
        // Trim email and password
        email = email.trim();
        password = password.trim();
        // Validate email using regex
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(email)) {
          emit(const AuthFailure('Please enter a valid email address.'));
          return;
        }
        // Validate password
        if (password.length < 6) {
          emit(const AuthFailure('Password must be at least 6 characters.'));
          return;
        }
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        emit(AuthSuccess());
      } on FirebaseAuthException catch (e) {
        // If the user is not found, create a new account
        if (e.code == 'user-not-found') {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          emit(AuthSuccess());
        } else {
          emit(
              AuthFailure(e.message ?? 'An error occurred. Please try again.'));
        }
      }
    });
    on<AuthSignOut>((event, emit) async {
      emit(AuthLoading());
      try {
        await FirebaseAuth.instance.signOut();
        emit(AuthSuccess());
      } on FirebaseAuthException catch (e) {
        emit(AuthFailure(e.message ??
            'An error occurred while signing out. Please try again.'));
      }
    });
  }
}
