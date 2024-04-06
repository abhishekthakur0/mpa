import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthFailure extends AuthState {
  // Add a message property to the AuthFailure class optionally
  final String? message;
  @override
  List<Object> get props => [];
  const AuthFailure([this.message]);
}
