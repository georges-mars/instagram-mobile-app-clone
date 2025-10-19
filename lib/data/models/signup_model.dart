class SignupModel {
  final String detail;
  final Map<String, dynamic> data;

  SignupModel({required this.detail, required this.data});

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      detail: json['detail'],
      data: Map<String, dynamic>.from(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'detail': detail,
      'data': data,
    };
  }
}
