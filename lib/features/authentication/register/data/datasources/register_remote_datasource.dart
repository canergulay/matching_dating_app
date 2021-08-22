import 'package:matchangoo/features/authentication/register/data/models/verify_response_config.dart';

abstract class RegisterRemoteDSContract {
  Future<SendResponse> sendSMS(final String verificationCode, final String phoneNumber);
  Future<VerifyResponse> verifySMS(final String verificationCode, final String phoneNumber);
}

class RegisterRemoteDataSource implements RegisterRemoteDSContract {
  @override
  Future<VerifyResponse> verifySMS(String verificationCode, String phoneNumber) {
    try {
      // TODO BURADA APİYE İSTEK ATIP KONTROL EDECEK
      return Future.value(VerifyResponse.ACCEPTED);
    } catch (e) {
      return Future.value(VerifyResponse.PROBLEM);
    }
  }

  @override
  Future<SendResponse> sendSMS(String verificationCode, String phoneNumber) {
    // TODO: implement sendSMS
    throw UnimplementedError();
  }
}
