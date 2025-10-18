part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class IsAuthenticated extends AuthState {
  final AuthModel authModel;

  IsAuthenticated({required this.authModel});
}

final class AuthFailed extends AuthState {
  final String errorMessage;

  AuthFailed(this.errorMessage);
}

final class AuthLoading extends AuthState {}
