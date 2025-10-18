class LoginModel {
  final String accessToken, refreshToken;

  LoginModel({required this.accessToken, required this.refreshToken});
  

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json['access'],
      refreshToken: json['refresh'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
