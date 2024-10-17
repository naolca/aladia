class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}

class LoginResponse {
  final String accessToken;

  LoginResponse({required this.accessToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'],
    );
  }
}
