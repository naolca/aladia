part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

// Event to check if the user exists
class CheckUserExistence extends LoginEvent {
  final String email;
  CheckUserExistence(this.email);
}

class LoginRequested extends LoginEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

class LoginWithGoogle extends LoginEvent {}

class LoginWithFacebook extends LoginEvent {}

class LoginWithApple extends LoginEvent {}
