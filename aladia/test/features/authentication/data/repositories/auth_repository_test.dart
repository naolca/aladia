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
  group(
      "Auth repository usecases when successful login and check user usecases",
      () {
    test(
        "When the Credential filled by the user is correct, the repository should return a success response with the accesstoken",
        () async {
      final authDataSource = MockAuthDataSourceSuccess();

      final authRepository = AuthRepositoryImpl(authDataSource);
      final response = await authRepository
          .login(LoginRequest(email: "mobile@aladia.io", password: "Pass@123"));
      expect(response.accessToken, "accessToken");
    });

    test(
        "Upon a true value return of a user check to the datasource, the repository should return a true value",
        () async {
      final authDataSource = MockAuthDataSourceSuccess();

      final authRepository = AuthRepositoryImpl(authDataSource);
      final response =
          await authRepository.checkUserExistence("mobile@aladia.io");
      expect(response, true);
    });
  });

  group("Auth repository when Login and Check user usecases are unsuccessful",
      () {
    test("should throw an exception upon wrong credentials", () async {
      final authDataSource = MockAuthDataSourceFailure();

      final authRepository = AuthRepositoryImpl(authDataSource);
      expect(
          () async => await authRepository.login(
              LoginRequest(email: "firaol@gmail.com", password: "password")),
          throwsException);
    });

    test("should return false upon a finding a user doesn't exist", () async {
      final authDataSource = MockAuthDataSourceFailure();

      final authRepository = AuthRepositoryImpl(authDataSource);
      final response =
          await authRepository.checkUserExistence("firaol@gmail.com");
      expect(response, false);
    });
  });
}
