import 'package:google_sign_in/google_sign_in.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';

class GoogleSignInRepo {
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
}
