import "package:aladia/features/authentication/data/models/login_model.dart";
import "package:aladia/features/authentication/data/repositories/auth_repository.dart";
import "package:aladia/features/authentication/domain/usecases/login_usecase.dart";
import "package:aladia/features/authentication/domain/usecases/user_existence_usecase.dart";
import "package:aladia/features/authentication/presentation/bloc/login_bloc.dart";

import "package:flutter_test/flutter_test.dart";

class MockAuthRepository extends AuthRepository {
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return LoginResponse(accessToken: "accessToken");
  }

  @override
  Future<bool> checkUserExistence(String email) {
    throw UnimplementedError();
  }
}

// create mocks for the usecases
class MockLoginUseCaseSuccess extends LoginUseCase {
  MockLoginUseCaseSuccess(super.repository);

  @override
  Future<LoginResponse> execute(String email, String password) async {
    return LoginResponse(accessToken: "accessToken");
  }
}

class MockLoginUseCaseFailure extends LoginUseCase {
  MockLoginUseCaseFailure(super.repository);

  @override
  Future<LoginResponse> execute(String email, String password) async {
    throw Exception("Invalid Credentials");
  }
}

class MockUserExistenceUseCaseSuccess extends UserExistenceUseCase {
  MockUserExistenceUseCaseSuccess(super.repository);

  @override
  Future<bool> execute(String email) async {
    return true;
  }
}

class MockUserExistenceUseCaseFailure extends UserExistenceUseCase {
  MockUserExistenceUseCaseFailure(super.repository);

  @override
  Future<bool> execute(String email) async {
    return false;
  }
}

void main() {
  group("LoginBloc When the operations are successful", () {
    final mockAuthRepository = MockAuthRepository();
    final mockUserExistenceUseCase =
        MockUserExistenceUseCaseSuccess(mockAuthRepository);

    test("should return a valid state", () {
      final loginUseCase = MockLoginUseCaseSuccess(mockAuthRepository);
      final loginBloc = LoginBloc(loginUseCase, mockUserExistenceUseCase);
      expect(loginBloc.state, isA<LoginInitial>());
    });

    test("should return a valid state", () async {
      final loginUseCase = MockLoginUseCaseSuccess(mockAuthRepository);
      final loginBloc = LoginBloc(loginUseCase, mockUserExistenceUseCase);

      loginBloc.add(LoginRequested("mobile@aladia.io", "Pass@123"));

      await expectLater(
        loginBloc.stream,
        emitsInOrder([
          isA<LoginLoading>(),
          isA<LoginSuccess>()
              .having((s) => s.accessToken, 'accessToken', 'accessToken'),
        ]),
      );
    });
  });

  group("LoginBloc When the operations are unsuccessful", () {
    final mockAuthRepository = MockAuthRepository();
    final mockUserExistenceUseCase =
        MockUserExistenceUseCaseFailure(mockAuthRepository);

    test("should return a valid state", () {
      final loginUseCase = MockLoginUseCaseFailure(mockAuthRepository);
      final loginBloc = LoginBloc(loginUseCase, mockUserExistenceUseCase);
      expect(loginBloc.state, isA<LoginInitial>());
    });

    test("should return a valid state", () async {
      final loginUseCase = MockLoginUseCaseFailure(mockAuthRepository);
      final loginBloc = LoginBloc(loginUseCase, mockUserExistenceUseCase);

      loginBloc.add(LoginRequested("firaol@gmail.com", "password"));

      await expectLater(
        loginBloc.stream,
        emitsInOrder([isA<LoginLoading>(), isA<LoginFailure>()]),
      );
    });
  });
}
