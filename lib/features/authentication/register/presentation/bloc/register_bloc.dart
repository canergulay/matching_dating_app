import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:matchangoo/core/components/toasts/toasts_onhand.dart';
import 'package:matchangoo/core/components/utils/loading_dialoger.dart';
import 'package:matchangoo/core/constants/app_constants.dart';
import 'package:matchangoo/features/Identification/domain/entities/registration_entity.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';
import 'package:matchangoo/features/authentication/register/domain/usecases/check_if_already_registrated.dart';
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
  final GoogleSignInRepo googleSignInRepo;
  final IdentificationCubit identificationCubit;
  final CheckIfAlreadyRegistered checkIfAlreadyRegistered;
  final SendVerificationEmail sendVerificationEmail;
  final CheckVerificationEmail checkVerificationEmail;
  final FacebookSignIn facebookSignIn;
  final Register register;
  RegisterBloc(
      {required this.googleSignInRepo,
      required this.identificationCubit,
      required this.sendVerificationEmail,
      required this.facebookSignIn,
      required this.checkIfAlreadyRegistered,
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
      yield* _checkAndSendVerificationMail(event.context, event.mail);
    } else if (event is EmailVerified) {
      yield RegisterWithEmailVerified();
    } else if (event is IdentificationAlmostFinished) {
      yield PhotoSelection();
    } else if (event is CompleteRegistration) {}
  }

  Stream<RegisterState> _checkAndSendVerificationMail(BuildContext context, String emailAdress) async* {
    print('sasasa1');
    final Result<bool> isAlreadyRegistered = await checkIfAlreadyRegistered(emailAdress);
    print('sasasa2');
    yield* isAlreadyRegistered.when(success: (bool alreadyRegistered) async* {
      print('sasasa3');

      print(alreadyRegistered);
      if (!alreadyRegistered) {
        yield* _sendVerificationMail(emailAdress);
      } else {
        showErrorToast(context, title: 'ERROR.TITLES.ALREADYREGISTERED'.tr(), message: 'ERROR.MESSAGES.ALREADYREGISTERED'.tr());
      }
    }, error: (CustomError error) async* {
      showGeneralErrorToast(context);
    });
  }

  Stream<RegisterState> _sendVerificationMail(String emailAdress) async* {
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

  //TODO : MOVE FACEBOOK AND GOOGLE SIGNIN
  //METHODS OUTSIDE OF THIS CLASS AND INJECT THEM FROM THE CONSTRUCTOR AS AN USECASE.

  Future<void> signInViaFacebook(BuildContext context) async {
    await facebookSignIn.signInViaFacebook(context, notRegistered: (name, email) {
      _setCredentialsAndContinue(name: name, email: email, password: AppConstants.shared.RVIAFB);
    });
  }

  Future<void> signInViaGoogle(BuildContext context) async {
    await googleSignInRepo.signInViaGoogle(context, notRegistered: (name, mail) {
      _setCredentialsAndContinue(name: name, email: mail, password: AppConstants.shared.RVIAGOOGLE);
    });
  }

  void _setCredentialsAndContinue({required String name, required String email, required String password}) {
    identificationCubit.registrationEntity.setName = name;
    identificationCubit.registrationEntity.setEmail = email;
    identificationCubit.registrationEntity.setPassword = password;
    emit(RegisterWithEmailVerified());
  }

  Future<void> completeRegistration() async {
    final Result<UserModel> registrationResult = await register(identificationCubit.registrationEntity);
    registrationResult.when(success: (UserModel user) {
      print('başarılı');
      emit(IdentificationCompleted());
    }, error: (CustomError error) {
      print('başarısız');
      print(error.errorCode);
    });
  }
}
