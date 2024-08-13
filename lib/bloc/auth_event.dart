part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginAction extends AuthEvent {
  final String email;
  final String password;

  LoginAction({required this.email, required this.password});
}

class LogoutAction extends AuthEvent{}
