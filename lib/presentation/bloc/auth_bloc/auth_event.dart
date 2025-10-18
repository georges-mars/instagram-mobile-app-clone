part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginRequested extends AuthEvent {
  final String username, password;

  LoginRequested(this.username, this.password);
}

final class SignupRequested extends AuthEvent {}

final class LogoutRequested extends AuthEvent {}
