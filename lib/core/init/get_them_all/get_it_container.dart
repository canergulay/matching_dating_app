import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:matchangoo/core/functionality/facebook_sign_in.dart';
import 'package:matchangoo/core/init/app_cubit/app_cubit.dart';
import 'package:matchangoo/core/structure/utils/enums/theme_types.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/interests_cubit.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/repo/degree_type_list.dart';
import '../../functionality/google_sign_in.dart';
import '../../../features/Identification/data/datasources/interest_datasource.dart';
import '../../../features/Identification/data/repositories/interest_repositary_impl.dart';
import '../../../features/Identification/domain/entities/registration_entity.dart';
import '../../../features/Identification/domain/usecases/get_interests.dart';
import '../../../features/Identification/presentation/cubit/gender_cubit.dart';
import '../../../features/Identification/presentation/cubit/interested_cubit.dart';
import '../../../features/Identification/presentation/cubit/profession_cubit.dart';
import '../../../features/Identification/presentation/pages/identification_pages.dart/repo/identification_page.dart';
import '../../../features/Identification/presentation/cubit/identification_cubit.dart';
import '../../../features/authentication/register/data/datasources/verification_email_datasource.dart';
import '../../../features/authentication/register/data/repositories/verification_email_repositary.dart';
import '../../../features/authentication/register/domain/usecases/check_verification_code.dart';
import '../../../features/authentication/register/domain/usecases/send_verification_email.dart';
import '../../../features/authentication/register/presentation/bloc/register_bloc.dart';
import '../../components/utils/adaptive_dialoger.dart';
import '../geolocation/location_manager.dart';

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

  //UTILS
  sl.registerSingleton<AdaptiveDialoger>(AdaptiveDialoger());

  //SENDSMSDEPENDENCIES
  registerSMSVerificationModul();

  //REGISTER FEATURE
  registerModule();

  //INIT APP CUBIT
  appCubitInitialization();
}

void registerSMSVerificationModul() {
  sl.registerFactory<SendVerificationSMS>(() => SendVerificationSMS(smsVerifyRepositary: sl()));
  sl.registerFactory<VerifySMSCode>(() => VerifySMSCode(smsVerifyRepositary: sl()));
  sl.registerFactory<SMSVerifyRepositary>(() => SMSVerifyRepositary(smsVerifyRemoteDataSource: sl()));
  sl.registerFactory<SMSVerifyRemoteDataSource>(() => SMSVerifyRemoteDataSource());
}

void registerModule() {
  sl.registerFactory<RegisterBloc>(() => RegisterBloc(
      identificationCubit: sl(), facebookSignIn: sl(), sendVerificationEmail: sl(), checkVerificationEmail: sl(), googleSignInRepo: sl()));
  sl.registerFactory<IdentificationCubit>(() =>
      IdentificationCubit(professionCubit: sl(), interestedInCubit: sl(), genderCubit: sl(), registrationEntity: sl(), identificationRepo: sl()));

  sl.registerFactory<SendVerificationEmail>(() => SendVerificationEmail(verificationEmailRepositary: sl()));
  sl.registerFactory<CheckVerificationEmail>(() => CheckVerificationEmail(verificationEmailRepositary: sl()));
  sl.registerFactory<GoogleSignInRepo>(() => GoogleSignInRepo());
  sl.registerLazySingleton<FacebookSignIn>(() => FacebookSignIn());
  sl.registerFactory<VerificationEmailRepositary>(() => VerificationEmailRepositary(verificationEmailDataSource: sl()));
  sl.registerFactory<VerificationEmailDataSource>(() => VerificationEmailDataSource());
  sl.registerFactory<IdentificationRepo>(() => IdentificationRepo());

  sl.registerFactory<RegistrationEntity>(() => RegistrationEntity());
  sl.registerFactory<GenderCubit>(() => GenderCubit());
  sl.registerFactory<InterestedInCubit>(() => InterestedInCubit());
  sl.registerFactory<ProfessionCubit>(() => ProfessionCubit(degreeCubit: sl()));
  sl.registerFactory<DegreeCubit>(() => DegreeCubit(degreesRepo: DegreesRepo()));
  sl.registerFactory<InterestManagerCubit>(
      () => InterestManagerCubit(getAllInterests: sl(), languagescubit: sl(), onlinegamescubit: sl(), petscubit: sl(), sportscubit: sl()));
  sl.registerFactory<GetAllInterests>(() => GetAllInterests(interestRepositary: sl()));
  sl.registerFactory<InterestRepositary>(() => InterestRepositary(interestDataSource: sl()));
  sl.registerFactory<InterestDataSource>(() => InterestDataSource());
  sl.registerFactory<InterestsCubit>(() => InterestsCubit());
}

void appCubitInitialization() {
  String defaultLocale = Platform.localeName;

  AppState appInitialState = AppState(currentLanguage: defaultLocale, currentTheme: ThemeType.LIGHT);
  sl.registerFactory<AppCubit>(() => AppCubit(
        initialState: appInitialState,
      ));
}
