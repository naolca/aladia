import 'package:aladia/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:aladia/features/authentication/data/models/login_model.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<bool> checkUserExistence(String email); // Add user existence method
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await remoteDataSource.login(loginRequest);
  }

  @override
  Future<bool> checkUserExistence(String email) async {
    return await remoteDataSource.checkUserExistence(email);
  }
}
