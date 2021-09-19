part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class EmailVerifyWaiting extends RegisterEvent {
  final String mail;
  final String password;
  final BuildContext context;
  EmailVerifyWaiting({required this.mail, required this.context, required this.password});
}

class EmailVerified extends RegisterEvent {}

class IdentificationAlmostFinished extends RegisterEvent {}

class CompleteRegistration extends RegisterEvent {}
