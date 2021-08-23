part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class EmailAdressTyped extends RegisterEvent {
  final String emailAdressChanged;
  EmailAdressTyped({required this.emailAdressChanged});
}

class EmailVerified extends RegisterEvent {}
