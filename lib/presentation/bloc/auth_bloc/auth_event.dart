part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginRequested extends AuthEvent {
  final String username, password;

  LoginRequested(this.username, this.password);
}

final class SignupRequested extends AuthEvent {
  final String username, email, password;

  SignupRequested(this.username, this.email, this.password);
}

final class LogoutRequested extends AuthEvent {}
