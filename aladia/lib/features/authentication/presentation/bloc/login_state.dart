part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String accessToken;
  LoginSuccess(this.accessToken);
}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}
