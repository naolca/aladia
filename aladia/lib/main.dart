import 'package:aladia/features/authentication/presentation/pages/password_fill_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aladia/features/authentication/presentation/pages/login_page.dart';
import 'package:aladia/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:aladia/features/authentication/data/repositories/auth_repository.dart';
import 'package:aladia/features/authentication/domain/usecases/login_usecase.dart';
import 'package:aladia/features/authentication/domain/usecases/user_existence_usecase.dart'; // Import for the new use case
import 'package:aladia/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:aladia/core/app_theme.dart';

void main() {
  final authRemoteDataSource =
      AuthRemoteDataSourceImpl('https://dev-api.aladia.io/v2');
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);

  // Initialize both use cases
  final loginUseCase = LoginUseCase(authRepository);
  final userExistenceUseCase =
      UserExistenceUseCase(authRepository); // Initialize UserExistenceUseCase

  runApp(MyApp(
    loginUseCase: loginUseCase,
    userExistenceUseCase: userExistenceUseCase, // Pass the use case to the app
  ));
}

class MyApp extends StatelessWidget {
  final LoginUseCase loginUseCase;
  final UserExistenceUseCase
      userExistenceUseCase; // Add a parameter for the new use case

  const MyApp({
    super.key,
    required this.loginUseCase,
    required this.userExistenceUseCase, // Accept the new use case
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(loginUseCase, userExistenceUseCase),
        ),
        // You can add another Bloc for user existence check if necessary
        // e.g. BlocProvider(create: (context) => UserExistenceBloc(userExistenceUseCase))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: const LoginPage(),
        ),
      ),
    );
  }
}
