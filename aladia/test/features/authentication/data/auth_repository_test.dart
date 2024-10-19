import "package:aladia/features/authentication/data/datasource/auth_remote_datasource.dart";
import "package:aladia/features/authentication/data/models/login_model.dart";
import "package:aladia/features/authentication/data/repositories/auth_repository.dart";

import "package:flutter_test/flutter_test.dart";

class MockAuthDataSourceSuccess extends AuthRemoteDataSource {
  @override
  Future<bool> checkUserExistence(String email) async {
    return true;
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    // TODO: implement login
    return LoginResponse(accessToken: "accessToken");
  }
}

class MockAuthDataSourceFailure extends AuthRemoteDataSource {
  @override
  Future<bool> checkUserExistence(String email) async {
    return false;
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    throw Exception("Invalid Credentials");
  }
}

void main() {
  group("Auth repository usecases when successful", () {
    test("should return a valid response", () async {
      final authDataSource = MockAuthDataSourceSuccess();

      final authRepository = AuthRepositoryImpl(authDataSource);
      final response = await authRepository
          .login(LoginRequest(email: "mobile@aladia.io", password: "Pass@123"));
      expect(response.accessToken, "accessToken");
    });

    test("should return true", () async {
      final authDataSource = MockAuthDataSourceSuccess();

      final authRepository = AuthRepositoryImpl(authDataSource);
      final response =
          await authRepository.checkUserExistence("mobile@aladia.io");
      expect(response, true);
    });
  });

  group("Auth repository usecases when unsuccessful", () {
    test("should throw an exception", () async {
      final authDataSource = MockAuthDataSourceFailure();

      final authRepository = AuthRepositoryImpl(authDataSource);
      expect(
          () async => await authRepository.login(
              LoginRequest(email: "firaol@gmail.com", password: "password")),
          throwsException);
    });

    test("should return false", () async {
      final authDataSource = MockAuthDataSourceFailure();

      final authRepository = AuthRepositoryImpl(authDataSource);
      final response =
          await authRepository.checkUserExistence("firaol@gmail.com");
      expect(response, false);
    });
  });
}
