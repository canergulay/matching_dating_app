import '../../data/models/verify_response_config.dart';
import '../../data/repositories/sms_verify_repositary.dart';

class SendVerificationSMS {
  // We will put it aside since the sms services charge too much and
  // it is not sensible to start off with sms-verification, unaffordable.
  // We will activate as we make some profit from the initial relases.
  final SMSVerifyRepositary smsVerifyRepositary;
  SendVerificationSMS({required this.smsVerifyRepositary});

  Future<SendResponse> call({required String phoneNumber}) async {
    SendResponse _response = await smsVerifyRepositary.sendSMS(phoneNumber: phoneNumber);
    return _response;
  }
}

class VerifySMSCode {
  final SMSVerifyRepositary smsVerifyRepositary;

  Future<VerifyResponse> call({required String phoneNumber, required String verificationCode}) async {
    VerifyResponse _response = await smsVerifyRepositary.verifyCode(phoneNumber: phoneNumber, verificationCode: verificationCode);
    return _response;
  }

  VerifySMSCode({required this.smsVerifyRepositary});
}
