import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:matchangoo/features/Identification/data/datasources/get_location_local_dataprovider.dart';
import 'package:matchangoo/features/Identification/data/datasources/upload_image_datasource.dart';
import 'package:matchangoo/features/Identification/data/repositories/get_location_repositary_impl.dart';
import 'package:matchangoo/features/Identification/data/repositories/upload_image_impl.dart';
import 'package:matchangoo/features/Identification/domain/usecases/get_location.dart';
import 'package:matchangoo/features/Identification/presentation/cubit/photo_selection_cubit.dart';
import 'package:matchangoo/features/authenticated/matching/data/datasources/load_missing_location_datasource.dart';
import 'package:matchangoo/features/authenticated/matching/data/repositories/load_missing_location.dart';
import 'package:matchangoo/features/authenticated/matching/domain/usecases/load_missing_location.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/matching_bloc.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/matching_users_cubit.dart';
import 'package:matchangoo/features/authentication/authentication_control/bloc/authentication_bloc.dart';
import 'package:matchangoo/features/authentication/login/data/datasources/check_if_acc_exist_ds.dart';
import 'package:matchangoo/features/authentication/login/data/datasources/login_datasource.dart';
import 'package:matchangoo/features/authentication/login/data/datasources/user_repositary_datasource.dart';
import 'package:matchangoo/features/authentication/login/data/repositories/check_if_acc_exist_repo_implementation.dart';
import 'package:matchangoo/features/authentication/login/data/repositories/login_repositary_implementation.dart';
import 'package:matchangoo/features/authentication/login/data/repositories/user_repositary_implementation.dart';
import 'package:matchangoo/features/authentication/login/domain/usecases/check_if_acc_exist.dart';
import 'package:matchangoo/features/authentication/login/domain/usecases/get_usermodel.dart';
import 'package:matchangoo/features/authentication/login/domain/usecases/login.dart';
import 'package:matchangoo/features/authentication/login/presentation/bloc/login_bloc.dart';
import 'package:matchangoo/features/authentication/register/data/datasources/check_if_already_registrated_ds.dart';
import 'package:matchangoo/features/authentication/register/data/datasources/registration_datasource.dart';
import 'package:matchangoo/features/authentication/register/data/repositories/check_if_already_registrated_repositary.dart';
import 'package:matchangoo/features/authentication/register/data/repositories/registration_repositary.dart';
import 'package:matchangoo/features/authentication/register/domain/usecases/check_if_already_registrated.dart';
import 'package:matchangoo/features/authentication/register/domain/usecases/register.dart';
import '../../functionality/facebook_sign_in.dart';
import '../app_cubit/app_cubit.dart';
import '../../structure/utils/enums/theme_types.dart';
import '../../../features/Identification/presentation/cubit/interests_cubit.dart';
import '../../../features/Identification/presentation/pages/identification_pages.dart/repo/degree_type_list.dart';
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

import '../../ui/theme/theme_controller.dart';
import '../../../features/authentication/phone_verification/data/datasources/register_remote_datasource.dart';
import '../../../features/authentication/phone_verification/data/repositories/sms_verify_repositary.dart';
import '../../../features/authentication/phone_verification/domain/usecases/verify_send_sms.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //LOCATION INJECTIONS
  _locationInitializations();
  //THEME SUBSCRIPTION//
  _themeAndUtilModule();

  //SENDSMSDEPENDENCIES
  _registerSMSVerificationModul();

  //REGISTER FEATURE
  _registerModule();

  //LOGIN FEATURE
  _loginModule();

  //AUTHENTICATION FEATURE
  _authenTicationModule();

  //INIT APP CUBIT
  _appCubitInitialization();

  _matchingmodule();
}

void _authenTicationModule() {
  sl.registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc(getUserByToken: sl()));
  sl.registerFactory<GetUserByToken>(() => GetUserByToken(userRepositary: sl()));
  sl.registerFactory<UserRepositary>(() => UserRepositary(userRepositaryDataSource: sl()));
  sl.registerFactory<UserDataSource>(() => UserDataSource());
}

void _themeAndUtilModule() {
  sl.registerFactory<ThemeController>(() => ThemeController());
  sl.registerSingleton<AdaptiveDialoger>(AdaptiveDialoger());
}

void _registerSMSVerificationModul() {
  sl.registerFactory<SendVerificationSMS>(() => SendVerificationSMS(smsVerifyRepositary: sl()));
  sl.registerFactory<VerifySMSCode>(() => VerifySMSCode(smsVerifyRepositary: sl()));
  sl.registerFactory<SMSVerifyRepositary>(() => SMSVerifyRepositary(smsVerifyRemoteDataSource: sl()));
  sl.registerFactory<SMSVerifyRemoteDataSource>(() => SMSVerifyRemoteDataSource());
}

void _registerModule() {
  sl.registerFactory<RegisterBloc>(() => RegisterBloc(
      register: sl(),
      identificationCubit: sl(),
      facebookSignIn: sl(),
      sendVerificationEmail: sl(),
      checkIfAlreadyRegistered: sl(),
      checkVerificationEmail: sl(),
      googleSignInRepo: sl()));
  sl.registerFactory<IdentificationCubit>(() =>
      IdentificationCubit(professionCubit: sl(), interestedInCubit: sl(), genderCubit: sl(), registrationEntity: sl(), identificationRepo: sl()));
  sl.registerFactory<Register>(() => Register(registrationRepositary: sl()));
  sl.registerFactory<RegistrationRepositary>(() => RegistrationRepositary(dataSource: sl()));
  sl.registerFactory<RegistrationDataSource>(() => RegistrationDataSource());
  sl.registerFactory<SendVerificationEmail>(() => SendVerificationEmail(verificationEmailRepositary: sl()));
  sl.registerFactory<CheckVerificationEmail>(() => CheckVerificationEmail(verificationEmailRepositary: sl()));
  sl.registerFactory<GoogleSignInRepo>(() => GoogleSignInRepo(checkIfAlreadyRegistered: sl(), checkIfAccountExist: sl()));
  sl.registerLazySingleton<FacebookSignIn>(() => FacebookSignIn(checkIfAlreadyRegistered: sl(), checkIfAccountExist: sl()));
  sl.registerFactory<CheckIfAlreadyRegistered>(() => CheckIfAlreadyRegistered(checkIfAlreadyRegistratedRepo: sl()));
  sl.registerFactory<CheckIfAlreadyRegistratedRepo>(() => CheckIfAlreadyRegistratedRepo(checkIfAlreadyRegisteredDS: sl()));
  sl.registerFactory<CheckIfAlreadyRegisteredDS>(() => CheckIfAlreadyRegisteredDS());
  sl.registerFactory<VerificationEmailRepositary>(() => VerificationEmailRepositary(verificationEmailDataSource: sl()));
  sl.registerFactory<VerificationEmailDataSource>(() => VerificationEmailDataSource());
  sl.registerFactory<IdentificationRepo>(() => IdentificationRepo());
  sl.registerFactory<PhotoSelectionCubit>(() => PhotoSelectionCubit(sl()));
  sl.registerFactory<UploadUserImageRepositary>(() => UploadUserImageRepositary(uploadImageDS: sl()));
  sl.registerFactory<UploadImageDS>(() => UploadImageDS());
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

void _loginModule() {
  sl.registerFactory<LoginBloc>(() => LoginBloc(login: sl(), facebookSignIn: sl(), googleSignInRepo: sl()));
  sl.registerFactory<Login>(() => Login(loginRepositary: sl()));
  sl.registerFactory<CheckIfAccountExist>(() => CheckIfAccountExist(checkIfAccounExistRepositary: sl()));

  sl.registerFactory<CheckIfAccounExistRepositary>(() => CheckIfAccounExistRepositary(checkIfAccountExistDataSource: sl()));
  sl.registerFactory<CheckIfAccountExistDataSource>(() => CheckIfAccountExistDataSource());

  sl.registerFactory<LoginRepositary>(() => LoginRepositary(loginDataSource: sl()));
  sl.registerFactory<LoginDataSource>(() => LoginDataSource());
}

void _appCubitInitialization() {
  String defaultLocale = Platform.localeName;

  AppState appInitialState = AppState(currentLanguage: defaultLocale, currentTheme: ThemeType.LIGHT);
  sl.registerFactory<AppCubit>(() => AppCubit(
        initialState: appInitialState,
      ));
}

void _locationInitializations() {
  sl.registerFactory<GetLocation>(() => GetLocation(getLocationRepositary: sl()));
  sl.registerFactory<GetLocationRepositary>(() => GetLocationRepositary(getLocationDataProvider: sl()));
  sl.registerFactory<GetLocationDataProvider>(() => GetLocationDataProvider());
}

void _matchingmodule() {
  sl.registerLazySingleton<MatchingBloc>(() => MatchingBloc(loadMissingLocation: sl(), candidateUsersCubit: sl()));
  sl.registerFactory<CandidateUsersCubit>(() => CandidateUsersCubit());
  sl.registerFactory<LoadMissingLocation>(() => LoadMissingLocation(loadMissingLocationRepositary: sl()));
  sl.registerFactory<LoadMissingLocationRepositary>(() => LoadMissingLocationRepositary(loadMissingLocationDataSource: sl()));
  sl.registerFactory<LoadMissingLocationDataSource>(() => LoadMissingLocationDataSource());
}
