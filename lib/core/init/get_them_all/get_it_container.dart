import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:matchangoo/core/init/geolocation/location_manager.dart';

final sl = GetIt.instance;

Future<void> init() async {
  print('1');
  sl.registerFactory(() => LocationManager(location: sl()));
  sl.registerFactory(() => Location());
  print('2');
}
