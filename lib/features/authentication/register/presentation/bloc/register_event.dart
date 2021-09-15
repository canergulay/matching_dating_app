part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class EmailVerifyWaiting extends RegisterEvent {
  final String mail;
  final String password;
  EmailVerifyWaiting({required this.mail, required this.password});
}

class EmailVerified extends RegisterEvent {}

class IdentificationAlmostFinished extends RegisterEvent {}

class Completed extends RegisterEvent {}
