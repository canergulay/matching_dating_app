part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class EmailAdressTyped extends RegisterEvent {
  final String emailAdressChanged;
  EmailAdressTyped({required this.emailAdressChanged});
}

class EmailVerifyWaiting extends RegisterEvent {}

class EmailVerified extends RegisterEvent {}
