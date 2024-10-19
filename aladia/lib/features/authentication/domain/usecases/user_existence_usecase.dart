import 'package:aladia/features/authentication/data/repositories/auth_repository.dart';

class UserExistenceUseCase {
  final AuthRepository authRepository;

  UserExistenceUseCase(this.authRepository);

  Future<bool> execute(String email) async {
    return await authRepository.checkUserExistence(email);
  }
}
