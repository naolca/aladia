part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginRequested extends LoginEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

class LoginWithGoogle extends LoginEvent {}

class LoginWithFacebook extends LoginEvent {}

class LoginWithApple extends LoginEvent {}
