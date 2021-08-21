import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:matchangoo/core/components/utils/adaptive_dialoger.dart';
import 'package:matchangoo/core/init/geolocation/location_manager.dart';
import 'package:matchangoo/core/init/theme_manager/theme_manager_cubit.dart';
import 'package:matchangoo/core/ui/theme/theme_controller.dart';

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
}
