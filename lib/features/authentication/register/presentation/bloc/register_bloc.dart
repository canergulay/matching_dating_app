import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:matchangoo/core/components/utils/loading_dialoger.dart';
import 'package:matchangoo/features/Identification/domain/entities/registration_entity.dart';
import 'package:matchangoo/features/authentication/register/domain/usecases/register.dart';
import '../../../../../core/functionality/facebook_sign_in.dart';
import '../../../../../core/functionality/google_sign_in.dart';
import '../../../../../core/result_error/errors/custom_error.dart';
import '../../../../../core/result_error/result_freezed/result.dart';

import '../../../../Identification/presentation/cubit/identification_cubit.dart';
import '../../domain/entities/verification_control.dart';
import '../../domain/usecases/check_verification_code.dart';
import '../../domain/usecases/send_verification_email.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  GoogleSignInRepo googleSignInRepo;
  IdentificationCubit identificationCubit;
  SendVerificationEmail sendVerificationEmail;
  CheckVerificationEmail checkVerificationEmail;
  FacebookSignIn facebookSignIn;
  Register register;
  RegisterBloc(
      {required this.googleSignInRepo,
      required this.identificationCubit,
      required this.sendVerificationEmail,
      required this.facebookSignIn,
      required this.register,
      required this.checkVerificationEmail})
      : super(RegisterInitial());

  late String verificationCode;

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is EmailVerifyWaiting) {
      identificationCubit.registrationEntity.setEmail = event.mail;
      identificationCubit.registrationEntity.setPassword = event.password;
      yield* _sendVerificationCode(event.mail);
    } else if (event is EmailVerified) {
      yield RegisterWithEmailVerified();
    } else if (event is IdentificationAlmostFinished) {
      yield PhotoSelection();
    } else if (event is CompleteRegistration) {
      yield IdentificationCompleted();
    }
  }

  Stream<RegisterState> _sendVerificationCode(String emailAdress) async* {
    final Result<bool> sonuc = await sendVerificationEmail(emailAdress);

    yield sonuc.when(success: (bool result) {
      if (result) {
        return RegisterWithEmailSent();
      } else {
        return RegisterWithEmailError();
      }
    }, error: (CustomError error) {
      return RegisterWithEmailError();
    });
  }

  Future<void> verifyCodeAndMail(BuildContext context) async {
    final VerificationControl verificationCredentials =
        VerificationControl(verificationCode: verificationCode, verificationEmail: identificationCubit.registrationEntity.email ?? 'null');
    ProgressIndicator.instance.showLoadingIndicator(context);
    final Result<bool> verificationResult = await checkVerificationEmail(verificationCredentials);
    await Future.delayed(const Duration(seconds: 2), () {
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

  Future<void> signInViaFacebook() async {
    final Result<Map<String, dynamic>> facebookLoginResult = await facebookSignIn.signIn();
    facebookLoginResult.when(success: (Map<String, dynamic> userCredentials) {
      _setCredentialsAndContinue(name: userCredentials['name'], email: userCredentials['email'], password: 'facebook');
    }, error: (CustomError error) {
      switch (error.errorCode) {
        case 10:
          //TODO : ADD DIALOG : UNEXPECTED ERROR,
          break;
        case 20:
          //TODO : ADD DIALOG : COULDN'T LOGIN
          break;
        default:
      }
    });
  }

  Future<void> signInViaGoogle() async {
    final Result<GoogleSignInAccount> info = await googleSignInRepo.signIn();
    info.when(success: (GoogleSignInAccount credentials) {
      _setCredentialsAndContinue(name: credentials.displayName ?? '', email: credentials.email, password: 'google');
    }, error: (CustomError error) {
      switch (error.errorCode) {
        case 10:
          break;
        case 20:
          break;
        default:
      }
    });
  }

  void _setCredentialsAndContinue({required String name, required String email, required String password}) {
    identificationCubit.registrationEntity.setName = name;
    identificationCubit.registrationEntity.setEmail = email;
    identificationCubit.registrationEntity.setPassword = password;
    emit(RegisterWithEmailVerified());
  }
}
