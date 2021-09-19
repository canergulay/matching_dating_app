import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:matchangoo/core/components/toasts/toasts_onhand.dart';
import 'package:matchangoo/core/constants/error_constants.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';
import 'package:matchangoo/features/authentication/login/domain/usecases/check_if_acc_exist.dart';
import 'package:matchangoo/features/authentication/register/domain/usecases/check_if_already_registrated.dart';
import '../result_error/errors/custom_error.dart';
import '../result_error/result_freezed/result.dart';

class GoogleSignInRepo {
  final CheckIfAlreadyRegistered checkIfAlreadyRegistered;
  final CheckIfAccountExist checkIfAccountExist;
  GoogleSignInRepo({required this.checkIfAlreadyRegistered, required this.checkIfAccountExist});
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<Result<GoogleSignInAccount>> signIn() async {
    try {
      print(1);

      GoogleSignInAccount? result = await _googleSignIn.signIn();
      if (result != null) {
        print(2);

        return Result.success(result);
      } else {
        print(3);

        return Result.error(CustomError(errorCode: 10));
      }
    } catch (e) {
      print('problem çıktı');
      print(e);
      return Result.error(CustomError(errorCode: 20));
    }
  }

  Future<void> signInViaGoogle(
    BuildContext context, {
    required Function(String, String) notRegistered,
  }) async {
    final Result<GoogleSignInAccount> info = await signIn();
    info.when(success: (GoogleSignInAccount credentials) async {
      final Result<bool> ifAlreadyRegistered = await checkIfAlreadyRegistered(credentials.email);
      ifAlreadyRegistered.when(success: (bool registered) {
        if (!registered) {
          notRegistered(credentials.displayName ?? ' ', credentials.email);
        } else {
          showErrorToast(context, title: 'ERROR.TITLES.ALREADYREGISTERED'.tr(), message: 'ERROR.MESSAGES.ALREADYREGISTERED'.tr());
        }
      }, error: (CustomError error) {
        showGeneralErrorToast(context);
      });
    }, error: (CustomError error) {
      showGeneralErrorToast(context);
    });
  }

  Future<void> loginViaGoogle(
    BuildContext context, {
    required Function(UserModel) onLoginSuccessful,
  }) async {
    final Result<GoogleSignInAccount> info = await signIn();
    info.when(success: (GoogleSignInAccount credentials) async {
      final Result<UserModel> accountCheckResult = await checkIfAccountExist(email: credentials.email);
      accountCheckResult.when(
          success: onLoginSuccessful,
          error: (CustomError error) {
            if (error.errorCode == ErrorConstants.shared.notAnAccount) {
              showErrorToast(context, title: 'ERROR.TITLES.NOACC'.tr(), message: 'ERROR.MESSAGES.NOACC'.tr());
            } else {
              showGeneralErrorToast(context);
            }
          });
    }, error: (CustomError error) {
      showErrorToast(context, title: 'ERROR.TITLES.ONE'.tr(), message: 'ERROR.MESSAGES.GOOGLE'.tr());
    });
  }
}
