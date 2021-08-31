import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:matchangoo/core/functionality/google_sign_in.dart';
import '../../../../../core/components/utils/loading_dialoger.dart';
import '../../../../../core/result_error/errors/custom_error.dart';
import '../../../../../core/result_error/result_freezed/result.dart';

import '../../../../Identification/presentation/cubit/identification_cubit.dart';
import '../../domain/entities/verification_control.dart';
import '../../domain/usecases/check_verification_code.dart';
import '../../domain/usecases/send_verification_email.dart';
import 'package:meta/meta.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  GoogleSignInRepo googleSignInRepo;
  IdentificationCubit identificationCubit;
  SendVerificationEmail sendVerificationEmail;
  CheckVerificationEmail checkVerificationEmail;
  RegisterBloc(
      {required this.googleSignInRepo, required this.identificationCubit, required this.sendVerificationEmail, required this.checkVerificationEmail})
      : super(RegisterInitial());
  late String emailAdress;
  late String verificationCode;

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
      yield* _sendVerificationCode();
    } else if (event is EmailVerified) {
      yield RegisterWithEmailVerified();
    }
  }

  Stream<RegisterState> _sendVerificationCode() async* {
    Result<bool> sonuc = await sendVerificationEmail(emailAdress);

    yield sonuc.when(success: (bool result) {
      if (result) {
        return RegisterWithEmailSent();
      } else {
        print(result);
        return RegisterWithEmailError();
      }
    }, error: (CustomError error) {
      print(error.message);
      return RegisterWithEmailError();
    });
  }

  void verifyCodeAndMail(BuildContext context) async {
    VerificationControl verificationCredentials = VerificationControl(verificationCode: verificationCode, verificationEmail: emailAdress);
    ProgressIndicator.instance.showLoadingIndicator(context);
    Result<bool> verificationResult = await checkVerificationEmail(verificationCredentials);
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
    verificationResult.when(success: (success) {
      if (success) {
        emit(RegisterWithEmailVerified());
      } else {
        emit(RegisterWithEmailError());
      }
    }, error: (error) {
      emit(RegisterWithEmailError());
    });
  }

  set setCode(String code) {
    verificationCode = code;
  }
}
