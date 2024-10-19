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

// New state to handle if the user exists
class UserExists extends LoginState {
  final String email;
  UserExists(this.email);
}

// New state to handle if the user does not exist
class UserDoesNotExist extends LoginState {}
