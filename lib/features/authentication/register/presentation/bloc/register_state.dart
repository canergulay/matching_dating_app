part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterEmailAdressTyped extends RegisterState {}

class RegisterWithEmailSent extends RegisterState {}

class RegisterWithEmailVerified extends RegisterState {}

class PhotoSelection extends RegisterState {}

class IdentificationCompleted extends RegisterState {}

class RegisterWithEmailError extends RegisterState {}
