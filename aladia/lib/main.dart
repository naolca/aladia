import 'package:aladia/features/authentication/presentation/pages/password_fill_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aladia/features/authentication/presentation/pages/login_page.dart';
import 'package:aladia/features/authentication/data/datasource/auth_remote_datasource.dart';
import 'package:aladia/features/authentication/data/repositories/auth_repository.dart';
import 'package:aladia/features/authentication/domain/usecases/login_usecase.dart';
import 'package:aladia/features/authentication/domain/usecases/user_existence_usecase.dart';
import 'package:aladia/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:aladia/core/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart'; // To store theme preference

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures that plugin services are initialized
  final authRemoteDataSource =
      AuthRemoteDataSourceImpl('https://dev-api.aladia.io/v2');
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);

  // Initialize both use cases
  final loginUseCase = LoginUseCase(authRepository);
  final userExistenceUseCase =
      UserExistenceUseCase(authRepository); // Initialize UserExistenceUseCase

  // Load the user's theme preference before building the app
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? savedThemeMode = prefs.getString('themeMode');

  // Fallback to system theme if no preference is saved (null case)
  ThemeMode initialThemeMode = ThemeMode.system; // Default is system theme

  if (savedThemeMode != null) {
    if (savedThemeMode == 'light') {
      initialThemeMode = ThemeMode.light;
    } else if (savedThemeMode == 'dark') {
      initialThemeMode = ThemeMode.dark;
    }
  }

  runApp(MyApp(
    loginUseCase: loginUseCase,
    userExistenceUseCase: userExistenceUseCase,
    initialThemeMode: initialThemeMode, // Set initial theme mode
  ));
}

class MyApp extends StatefulWidget {
  final LoginUseCase loginUseCase;
  final UserExistenceUseCase userExistenceUseCase;
  final ThemeMode initialThemeMode; // Store initial theme mode

  const MyApp({
    super.key,
    required this.loginUseCase,
    required this.userExistenceUseCase,
    required this.initialThemeMode,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode =
        widget.initialThemeMode; // Set theme mode from saved preference
  }

  // Function to toggle theme and save it to SharedPreferences
  void _toggleTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
        prefs.setString('themeMode', 'dark'); // Save dark mode preference
      } else {
        _themeMode = ThemeMode.light;
        prefs.setString('themeMode', 'light'); // Save light mode preference
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              LoginBloc(widget.loginUseCase, widget.userExistenceUseCase),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _themeMode, // Use dynamic theme mode
        home: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          floatingActionButton: FloatingActionButton(
            onPressed: _toggleTheme,
            child: Icon(
              _themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
          body: const LoginPage(),
        ),
      ),
    );
  }
}
