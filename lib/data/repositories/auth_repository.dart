import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../core/services/auth_service.dart';
import '../../core/storage/token_storage.dart';
import '../models/auth_model.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository(this.authService);

  // parse JSON data - seperate process from the UI thread to avoid lag
  static AuthModel _parseUserCredentials(String responseBody) {
    final parseData = jsonDecode(responseBody);
    return AuthModel.fromJson(parseData);
  }

  Future<AuthModel> getUserCredentials(String username, String password) async {
    try {
      final userCredentials = await authService.login(username, password);
      final authModel = await compute(_parseUserCredentials, userCredentials);

      // Save tokens after successful login
      await TokenStorage.saveTokens(
        accessToken: authModel.accessToken,
        refreshToken: authModel.refreshToken,
      );
      return authModel;
    } catch (e) {
      throw e.toString();
    }
  }
}
