import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:matchangoo/core/components/toasts/toasts_onhand.dart';
import 'package:matchangoo/core/constants/error_constants.dart';
import 'package:matchangoo/core/functionality/facebook_sign_in.dart';
import 'package:matchangoo/core/functionality/google_sign_in.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';
import 'package:matchangoo/features/authentication/login/domain/usecases/check_if_acc_exist.dart';
import 'package:matchangoo/features/authentication/login/domain/usecases/login.dart';
import 'package:meta/meta.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GoogleSignInRepo googleSignInRepo;
  final FacebookSignIn facebookSignIn;
  final Login login;

  LoginBloc({required this.login, required this.facebookSignIn, required this.googleSignInRepo}) : super(LoginInitial());
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }

  Future<void> loginViaEmailPass(BuildContext context, {required String email, required String password}) async {
    Result<UserModel> loginResult = await login.call(email: email, password: password);
    loginResult.when(success: (UserModel userLogged) {
      print('yeah logged in!');
    }, error: (CustomError error) {
      if (error.errorCode == ErrorConstants.shared.notAnAccount) {
        showErrorToast(context, title: 'ERROR.TITLES.NOACC'.tr(), message: 'ERROR.MESSAGES.NOACC'.tr());
      } else if (error.errorCode == ErrorConstants.shared.wrongPassword) {
        showErrorToast(context, title: 'ERROR.TITLES.WRONGPASS'.tr(), message: 'ERROR.MESSAGES.WRONGPASS'.tr());
      } else {
        showGeneralErrorToast(context);
      }
    });
  }

  Future<void> loginViaGoogle(BuildContext context) async {
    await googleSignInRepo.loginViaGoogle(context, onLoginSuccessful: (UserModel user) {
      print(user);
    });
  }
}
