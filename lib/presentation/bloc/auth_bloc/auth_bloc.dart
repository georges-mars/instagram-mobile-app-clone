import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/login_model.dart';
import '../../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginRequested>(_authenticateUser);
  }

  Future<void> _authenticateUser(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    // app is loading
    emit(AuthLoading());
    try {
      final auth = await authRepository.getUserCredentials(event.username, event.password);
      emit(IsAuthenticated(authModel: auth));
    } catch(e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
