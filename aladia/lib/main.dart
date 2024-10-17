import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aladia/features/authentication/presentation/pages/login_page.dart';
import "package:aladia/features/authentication/data/datasource/auth_remote_datasource.dart";
import 'package:aladia/features/authentication/data/repositories/auth_repository.dart';
import 'package:aladia/features/authentication/domain/usecases/login_usecase.dart';
import 'package:aladia/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:aladia/core/app_theme.dart';

void main() {
  final authRemoteDataSource =
      AuthRemoteDataSourceImpl('https://dev-api.aladia.io/v2');
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);
  final loginUseCase = LoginUseCase(authRepository);

  runApp(MyApp(loginUseCase: loginUseCase));
}

class MyApp extends StatelessWidget {
  final LoginUseCase loginUseCase;

  const MyApp({super.key, required this.loginUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: BlocProvider(
        create: (context) => LoginBloc(loginUseCase),
        child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: const LoginPage()),
      ),
    );
  }
}
