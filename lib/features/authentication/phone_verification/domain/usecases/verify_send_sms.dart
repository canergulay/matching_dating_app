import 'package:matchangoo/features/authentication/phone_verification/data/models/verify_response_config.dart';
import 'package:matchangoo/features/authentication/phone_verification/data/repositories/sms_verify_repositary.dart';

class SendVerificationSMS {
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
