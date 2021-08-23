import '../datasources/register_remote_datasource.dart';
import '../models/verify_response_config.dart';
import '../../domain/repositories/sms_verify_repositary_contract.dart';

class SMSVerifyRepositary extends SMSVerifyRepositaryContract {
  final SMSVerifyRemoteDataSource smsVerifyRemoteDataSource;

  SMSVerifyRepositary({required this.smsVerifyRemoteDataSource});

  @override
  Future<SendResponse> sendSMS({required String phoneNumber}) async {
    return await Future.value(smsVerifyRemoteDataSource.sendSMS(phoneNumber));
  }

  @override
  Future<VerifyResponse> verifyCode({required String phoneNumber, required String verificationCode}) async {
    return await Future.value(smsVerifyRemoteDataSource.verifySMS(verificationCode, phoneNumber));
  }
}
