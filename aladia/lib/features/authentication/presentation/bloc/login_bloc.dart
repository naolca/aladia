import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:aladia/features/authentication/domain/usecases/login_usecase.dart';
import 'package:aladia/features/authentication/domain/usecases/user_existence_usecase.dart'; // Import the usecase for user existence

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final UserExistenceUseCase
      userExistenceUseCase; // Add user existence use case

  LoginBloc(this.loginUseCase, this.userExistenceUseCase)
      : super(LoginInitial()) {
    // Check if user exists
    on<CheckUserExistence>((event, emit) async {
      emit(LoginLoading());
      try {
        final userExists = await userExistenceUseCase.execute(event.email);
        if (userExists) {
          emit(UserExists(event.email));
        } else {
          emit(UserDoesNotExist());
        }
      } catch (error) {
        emit(LoginFailure('User existence check failed: ${error.toString()}'));
      }
    });

    // Handle Login with email and password
    on<LoginRequested>((event, emit) async {
      emit(LoginLoading());
      try {
        final response =
            await loginUseCase.execute(event.email, event.password);
        emit(LoginSuccess(response.accessToken));
      } catch (error) {
        emit(LoginFailure('${error.toString()}'));
      }
    });

    // Handle Login with Google
    on<LoginWithGoogle>((event, emit) async {
      emit(LoginLoading());
      try {
        await Future.delayed(Duration(seconds: 2));
        emit(LoginSuccess("success"));
      } catch (error) {
        emit(LoginFailure('Google Login Failed: ${error.toString()}'));
      }
    });

    // Handle Login with Facebook
    on<LoginWithFacebook>((event, emit) async {
      emit(LoginLoading());
      try {
        await Future.delayed(Duration(seconds: 2));
        emit(LoginSuccess("success"));
      } catch (error) {
        emit(LoginFailure('Facebook Login Failed: ${error.toString()}'));
      }
    });

    // Handle Login with Apple
    on<LoginWithApple>((event, emit) async {
      emit(LoginLoading());
      try {
        await Future.delayed(Duration(seconds: 2));
        emit(LoginSuccess("success"));
      } catch (error) {
        emit(LoginFailure('Apple Login Failed: ${error.toString()}'));
      }
    });
  }
}
