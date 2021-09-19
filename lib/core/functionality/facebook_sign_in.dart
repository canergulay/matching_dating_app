import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:matchangoo/core/components/toasts/toasts_onhand.dart';
import 'package:matchangoo/features/authentication/login/domain/usecases/check_if_acc_exist.dart';
import 'package:matchangoo/features/authentication/register/domain/usecases/check_if_already_registrated.dart';
import '../result_error/errors/custom_error.dart';
import '../result_error/result_freezed/result.dart';

class FacebookSignIn {
  final CheckIfAlreadyRegistered checkIfAlreadyRegistered;
  final CheckIfAccountExist checkIfAccountExist;

  FacebookSignIn({required this.checkIfAlreadyRegistered, required this.checkIfAccountExist});

  Future<Result<Map<String, dynamic>>> signIn() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        AccessToken? accessToken = result.accessToken;
        if (accessToken != null) {
          final userData = await FacebookAuth.instance.getUserData();

          return Result.success(userData);
        } else {
          //ERROR CODE 10 --> CREDENTIALS / ACCESS TOKEN WAS EMPTY
          return Result.error(CustomError(errorCode: 10));
        }
      } else {
        //ERROR CODE 20 --> LOGIN STATUS IS NOT SUCCESSFULL , WE COULD NOT LOGIN
        print(result.status);
        print(result.message);
        return Result.error(CustomError(errorCode: 20));
      }
    } catch (e) {
      return Result.error(CustomError(errorCode: 20));
    }
  }

  Future<void> signInViaFacebook(
    BuildContext context, {
    required Function(String, String) notRegistered,
  }) async {
    final Result<Map<String, dynamic>> facebookLoginResult = await signIn();
    facebookLoginResult.when(success: (Map<String, dynamic> userCredentials) async {
      final Result<bool> ifAlreadyRegistered = await checkIfAlreadyRegistered(userCredentials['email']);
      ifAlreadyRegistered.when(success: (bool registered) {
        if (!registered) {
          notRegistered(userCredentials['name'], userCredentials['email']);
          // _setCredentialsAndContinue(name: userCredentials['name'], email: userCredentials['email'], password: AppConstants.RVIAFB);
        } else {
          showErrorToast(context, title: 'ERROR.TITLES.ALREADYREGISTERED'.tr(), message: 'ERROR.MESSAGES.ALREADYREGISTERED'.tr());
        }
      }, error: (CustomError error) {
        print('error burda');
        showGeneralErrorToast(context);
      });
    }, error: (CustomError error) {
      showGeneralErrorToast(context);
    });
  }
}
