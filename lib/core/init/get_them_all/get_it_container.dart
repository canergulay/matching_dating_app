import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import '../../components/utils/adaptive_dialoger.dart';
import '../geolocation/location_manager.dart';
import '../theme_manager/theme_manager_cubit.dart';
import '../../ui/theme/theme_controller.dart';
import '../../../features/authentication/phone_verification/data/datasources/register_remote_datasource.dart';
import '../../../features/authentication/phone_verification/data/repositories/sms_verify_repositary.dart';
import '../../../features/authentication/phone_verification/domain/usecases/verify_send_sms.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //GENERAL INJECTIONS
  sl.registerFactory(() => LocationManager(location: sl()));
  sl.registerFactory(() => Location());

  //THEME SUBSCRIPTION//
  sl.registerFactory<ThemeController>(() => ThemeController());
  sl.registerSingleton<ThemeManagerCubit>(ThemeManagerCubit(sl()));

  //UTILS
  sl.registerSingleton<AdaptiveDialoger>(AdaptiveDialoger());

  //SENDSMSDEPENDENCIES
  registerSMSVerificationModul();
}

void registerSMSVerificationModul() {
  sl.registerFactory<SendVerificationSMS>(() => SendVerificationSMS(smsVerifyRepositary: sl()));
  sl.registerFactory<VerifySMSCode>(() => VerifySMSCode(smsVerifyRepositary: sl()));
  sl.registerFactory<SMSVerifyRepositary>(() => SMSVerifyRepositary(smsVerifyRemoteDataSource: sl()));
  sl.registerFactory<SMSVerifyRemoteDataSource>(() => SMSVerifyRemoteDataSource());
}
