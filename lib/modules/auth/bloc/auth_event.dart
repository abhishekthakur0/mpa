abstract class AuthEvent {
  const AuthEvent();
}

abstract class AuthSignIn extends AuthEvent {
  const AuthSignIn();
}

abstract class AuthSignOut extends AuthEvent {
  const AuthSignOut();
}
