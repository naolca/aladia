import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:aladia/features/authentication/data/models/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<bool> checkUserExistence(String email); // Add user existence check
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final String baseUrl;

  AuthRemoteDataSourceImpl(this.baseUrl);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(loginRequest.toJson()),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      throw Exception('Invalid Credentials');
    } else if (response.statusCode == 422) {
      throw Exception("Invalid Email");
    } else if (response.statusCode == 404) {
      throw Exception('User Not Found');
    } else {
      throw Exception('Unknown Error');
    }
  }

  @override
  Future<bool> checkUserExistence(String email) async {
    print("this got called");
    final response = await http.post(
      Uri.parse('$baseUrl/auth/user-existence'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"email": email}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['exists'];
    } else if (response.statusCode == 404) {
      return false;
    } else {
      throw Exception('Error checking user existence');
    }
  }
}
