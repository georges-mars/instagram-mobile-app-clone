import 'package:http/http.dart' as http;

import '../constants/api_endpoints.dart';

class AuthService {
  Future<String> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.login),
        body: {"email": username, "password": password},
      );

      switch (response.statusCode) {
        case 200:
          return response.body;
        case 400:
          throw Exception("Invalid data format provided!");
        case 401:
          // final data = jsonDecode(response.body);
          // final message = data["detail"] ?? 'Invalid credentials';
          // throw Exception(message);
          throw Exception('Invalid username or password!');
        case 404:
          throw Exception("We couldn't complete your request! Please try again later.");
        case 500:
          throw Exception("Something went wrong! Please try again later.");
        default:
          throw Exception("Unexpected error! (${response.statusCode}).");
      }
    } on http.ClientException {
      throw Exception("Please check your internet connection!");
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> signup(String username, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.signup),
        body: {"username": username, "email": email, "password": password},
      );

      switch (response.statusCode) {
        case 201:
          return "Account created successfully!";
        case 400:
          throw Exception("Invalid data format provided!");
        case 500:
          throw Exception("Something went wrong! Please try again later.");
        default:
          throw Exception("Unknown error occured! Please try again");
      }
    } on http.ClientException {
      throw Exception("Please check your internet connection!");
    } catch (e) {
      throw e.toString();
    }
  }
}
