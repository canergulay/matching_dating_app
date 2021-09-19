part of 'authentication_bloc.dart';

abstract class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final UserModel? user;
  const AuthenticationAuthenticated({required this.user});
}

class AuthenticationNotAuthenticated extends AuthenticationState {}
