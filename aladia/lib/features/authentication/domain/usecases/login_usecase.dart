import 'package:aladia/features/authentication/data/models/login_model.dart';
import 'package:aladia/features/authentication/data/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResponse> execute(String email, String password) async {
    final loginRequest = LoginRequest(email: email, password: password);
    return await repository.login(loginRequest);
  }
}
