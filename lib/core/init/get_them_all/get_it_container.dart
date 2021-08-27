import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:matchangoo/features/Identification/domain/entities/registration_entity.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/repo/identification_page.dart';
import '../../../features/Identification/presentation/cubit/identification_cubit.dart';
import '../../../features/authentication/register/data/datasources/verification_email_datasource.dart';
import '../../../features/authentication/register/data/repositories/verification_email_repositary.dart';
import '../../../features/authentication/register/domain/usecases/check_verification_code.dart';
import '../../../features/authentication/register/domain/usecases/send_verification_email.dart';
import '../../../features/authentication/register/presentation/bloc/register_bloc.dart';
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

  //REGISTER FEATURE
  registerModule();
}

void registerSMSVerificationModul() {
  sl.registerFactory<SendVerificationSMS>(() => SendVerificationSMS(smsVerifyRepositary: sl()));
  sl.registerFactory<VerifySMSCode>(() => VerifySMSCode(smsVerifyRepositary: sl()));
  sl.registerFactory<SMSVerifyRepositary>(() => SMSVerifyRepositary(smsVerifyRemoteDataSource: sl()));
  sl.registerFactory<SMSVerifyRemoteDataSource>(() => SMSVerifyRemoteDataSource());
}

void registerModule() {
  sl.registerFactory<RegisterBloc>(() => RegisterBloc(identificationCubit: sl(), sendVerificationEmail: sl(), checkVerificationEmail: sl()));
  sl.registerFactory<IdentificationCubit>(() => IdentificationCubit(registrationEntity: sl(), identificationRepo: sl()));
  sl.registerFactory<SendVerificationEmail>(() => SendVerificationEmail(verificationEmailRepositary: sl()));
  sl.registerFactory<CheckVerificationEmail>(() => CheckVerificationEmail(verificationEmailRepositary: sl()));
  sl.registerFactory<VerificationEmailRepositary>(() => VerificationEmailRepositary(verificationEmailDataSource: sl()));
  sl.registerFactory<VerificationEmailDataSource>(() => VerificationEmailDataSource());
  sl.registerFactory<IdentificationRepo>(() => IdentificationRepo());
  sl.registerFactory<RegistrationEntity>(() => RegistrationEntity());
}
