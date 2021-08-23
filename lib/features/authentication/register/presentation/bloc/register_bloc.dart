import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';

import 'package:matchangoo/features/Identification/presentation/cubit/identification_cubit.dart';
import 'package:matchangoo/features/authentication/register/domain/usecases/check_verification_code.dart';
import 'package:matchangoo/features/authentication/register/domain/usecases/send_verification_email.dart';
import 'package:meta/meta.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  IdentificationCubit identificationCubit;
  SendVerificationEmail sendVerificationEmail;
  CheckVerificationEmail checkVerificationEmail;
  RegisterBloc({required this.identificationCubit, required this.sendVerificationEmail, required this.checkVerificationEmail})
      : super(RegisterInitial());
  late String emailAdress;

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is EmailAdressTyped) {
      bool isEmail = EmailValidator.validate(event.emailAdressChanged);
      if (isEmail) {
        emailAdress = event.emailAdressChanged;
        yield (RegisterEmailAdressTyped());
      }
    } else if (event is EmailVerifyWaiting) {
      print('geldi');
      yield* _sendVerificationCode();
    } else if (event is EmailVerified) {
      yield RegisterWithEmailVerified();
    }
  }

  Stream<RegisterState> _sendVerificationCode() async* {
    print('geldi 2');
    Result<bool> sonuc = await sendVerificationEmail.call(emailAdress);
    print('geldi 3');
    yield sonuc.when(success: (bool result) {
      if (result) {
        return RegisterWithEmailVerified();
      } else {
        print(result);
        return RegisterWithEmailError();
      }
    }, error: (CustomError error) {
      print(error.message);
      return RegisterWithEmailError();
    });
  }
}
