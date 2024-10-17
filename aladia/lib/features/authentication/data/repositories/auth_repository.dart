import "package:aladia/features/authentication/data/datasource/auth_remote_datasource.dart";
import 'package:aladia/features/authentication/data/models/login_model.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest loginRequest);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await remoteDataSource.login(loginRequest);
  }
}
