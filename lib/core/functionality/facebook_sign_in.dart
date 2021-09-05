import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';

class FacebookSignIn {
  Future<Result<Map<String, dynamic>>> signIn() async {
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
  }
}
