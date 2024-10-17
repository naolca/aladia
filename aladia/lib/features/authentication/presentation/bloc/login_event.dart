part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginRequested extends LoginEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

final class LoginWithGoogle extends LoginEvent {}

final class LoginWithFacebook extends LoginEvent {}

final class LoginWithApple extends LoginEvent {}
