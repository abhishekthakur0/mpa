abstract class AuthEvent {
  const AuthEvent();
}

class AuthSignIn extends AuthEvent {
  const AuthSignIn();
}

class AuthSignOut extends AuthEvent {
  const AuthSignOut();
}

class AuthEmailChanged extends AuthEvent {
  final String email;
  const AuthEmailChanged(this.email);
}

class AuthPasswordChanged extends AuthEvent {
  final String password;
  const AuthPasswordChanged(this.password);
}
