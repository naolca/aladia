import "package:aladia/features/authentication/data/datasource/auth_remote_datasource.dart";
import "package:aladia/features/authentication/data/models/login_model.dart";
import "package:aladia/features/authentication/data/repositories/auth_repository.dart";
import "package:aladia/features/authentication/domain/usecases/login_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepositoryLoginSuccess extends AuthRepository {
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return LoginResponse(accessToken: "accessToken");
  }

  @override
  Future<bool> checkUserExistence(String email) {
    // TODO: implement checkUserExistence
    throw UnimplementedError();
  }
}

class MockAuthRepositoryLoginFailure extends AuthRepository {
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    throw Exception("Invalid Credentials");
  }

  @override
  Future<bool> checkUserExistence(String email) {
    throw UnimplementedError();
  }
}

void main() {
  group("LoginUseCase Tests", () {
    test(
        "if the repository returns a success message upon login attempt, it should return a valid response",
        () async {
      // create a mock repository class instance
      final authRepository = MockAuthRepositoryLoginSuccess();

      final loginUseCase = LoginUseCase(authRepository);
      final response =
          await loginUseCase.execute("mobile@aladia.io", "Pass@123");

      expect(response.accessToken, "accessToken");
    });

    test("should throw an exception if the login attemp isn't successful",
        () async {
      final authrepository = MockAuthRepositoryLoginFailure();
      final loginUseCase = LoginUseCase(authrepository);
      expect(
        () async => await loginUseCase.execute("firaol@gmail.com", "password"),
        throwsException,
      );
    });
  });
}

//////
