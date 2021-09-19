part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class Authenticate extends AuthenticationEvent {
  final UserModel user;
  const Authenticate({required this.user});
}

class Logout extends AuthenticationEvent {}
