import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../core/services/auth_service.dart';
import '../../core/utils/token_storage.dart';
import '../models/login_model.dart';
import '../models/signup_model.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository(this.authService);

  // parse JSON data - seperate process from the UI thread to avoid lag
  static LoginModel _parseLoginResponseData(String responseBody) {
    final parseData = jsonDecode(responseBody);
    return LoginModel.fromJson(parseData);
  }

  static SignupModel _parseSignupResponseData(String responseBody) {
    final parseData = jsonDecode(responseBody);
    return AuthModel.fromJson(parseData);
  }

  Future<LoginModel> getUserCredentials(String username, String password) async {
    try {
      final userCredentials = await authService.login(username, password);
      final responseData = await compute(_parseLoginResponseData, userCredentials);

      // Save tokens after successful login
      await TokenStorage.saveTokens(
        accessToken: responseData.accessToken,
        refreshToken: responseData.refreshToken,
      );
      return responseData;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<SignupModel> createUserAccount(String username, String email, String password) async {
    try {
      final userData = await authService.signup(username, email, password);
      return await compute(_parseSignupResponseData, userData);
    } catch (e) {
      throw e.toString();
    }
  }
}
