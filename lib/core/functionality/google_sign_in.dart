import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:matchangoo/core/components/toasts/toasts_onhand.dart';
import 'package:matchangoo/features/authentication/register/domain/usecases/check_if_already_registrated.dart';
import '../result_error/errors/custom_error.dart';
import '../result_error/result_freezed/result.dart';

class GoogleSignInRepo {
  final CheckIfAlreadyRegistered checkIfAlreadyRegistered;
  GoogleSignInRepo({required this.checkIfAlreadyRegistered});
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<Result<GoogleSignInAccount>> signIn() async {
    try {
      GoogleSignInAccount? result = await _googleSignIn.signIn();
      if (result != null) {
        return Result.success(result);
      } else {
        return Result.error(CustomError(errorCode: 10));
      }
    } catch (e) {
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
}
