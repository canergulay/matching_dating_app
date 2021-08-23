import '../../data/models/verify_response_config.dart';

abstract class SMSVerifyRepositaryContract {
  Future<SendResponse> sendSMS({required String phoneNumber});
  Future<VerifyResponse> verifyCode({required String phoneNumber, required String verificationCode});
}
