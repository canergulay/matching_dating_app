import '../models/verify_response_config.dart';

abstract class SMSVerifyRemoteDSContract {
  Future<SendResponse> sendSMS(final String phoneNumber);
  Future<VerifyResponse> verifySMS(final String verificationCode, final String phoneNumber);
}

class SMSVerifyRemoteDataSource implements SMSVerifyRemoteDSContract {
  @override
  Future<SendResponse> sendSMS(String phoneNumber) {
    try {
      // TODO BURADA APİYE İSTEK ATIP KONTROL EDECEK
      return Future.value(SendResponse.SENT);
    } catch (e) {
      return Future.value(SendResponse.ERROR);
    }
  }

  @override
  Future<VerifyResponse> verifySMS(String verificationCode, String phoneNumber) {
    try {
      // TODO BURADA APİYE İSTEK ATIP KONTROL EDECEK
      return Future.value(VerifyResponse.ACCEPTED);
    } catch (e) {
      return Future.value(VerifyResponse.PROBLEM);
    }
  }
}
