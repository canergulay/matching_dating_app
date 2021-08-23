part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterEmailAdressTyped extends RegisterState {}

class RegisterWithEmailVerified extends RegisterState {}

class RegisterWithEmailError extends RegisterState {}
