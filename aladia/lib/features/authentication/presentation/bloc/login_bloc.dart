import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    // Handle Login with email and password
    on<LoginRequested>((event, emit) async {
      emit(LoginLoading());
      try {
        // Simulate login process
        await Future.delayed(Duration(seconds: 2));

        // If login is successful, emit LoginSuccess
        emit(LoginSuccess());
      } catch (error) {
        // If login fails, emit LoginFailure
        emit(LoginFailure('Login Failed: ${error.toString()}'));
      }
    });

    // Handle Login with Google
    on<LoginWithGoogle>((event, emit) async {
      emit(LoginLoading());
      try {
        // Simulate Google login process
        await Future.delayed(Duration(seconds: 2));

        emit(LoginSuccess());
      } catch (error) {
        emit(LoginFailure('Google Login Failed: ${error.toString()}'));
      }
    });

    // Handle Login with Facebook
    on<LoginWithFacebook>((event, emit) async {
      emit(LoginLoading());
      try {
        // Simulate Facebook login process
        await Future.delayed(Duration(seconds: 2));

        emit(LoginSuccess());
      } catch (error) {
        emit(LoginFailure('Facebook Login Failed: ${error.toString()}'));
      }
    });

    // Handle Login with Apple
    on<LoginWithApple>((event, emit) async {
      emit(LoginLoading());
      try {
        // Simulate Apple login process
        await Future.delayed(Duration(seconds: 2));

        emit(LoginSuccess());
      } catch (error) {
        emit(LoginFailure('Apple Login Failed: ${error.toString()}'));
      }
    });
  }
}
