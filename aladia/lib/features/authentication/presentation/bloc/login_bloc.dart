import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:aladia/features/authentication/domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    // Handle Login with email and password
    on<LoginRequested>((event, emit) async {
      emit(LoginLoading());
      try {
        final response =
            await loginUseCase.execute(event.email, event.password);
        //think about including the response in the state
        emit(LoginSuccess(response.accessToken));
      } catch (error) {
        emit(LoginFailure('Failed to login: ${error.toString()}'));
      }
    });

    // Handle Login with Google
    on<LoginWithGoogle>((event, emit) async {
      emit(LoginLoading());
      try {
        // Simulate Google login process
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
        // Simulate Facebook login process
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
        // Simulate Apple login process
        await Future.delayed(Duration(seconds: 2));

        emit(LoginSuccess("success"));
      } catch (error) {
        emit(LoginFailure('Apple Login Failed: ${error.toString()}'));
      }
    });
  }
}
