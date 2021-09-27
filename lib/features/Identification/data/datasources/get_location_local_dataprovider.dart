import 'package:geolocator/geolocator.dart';
import 'package:matchangoo/core/appetizers/global_models/location.dart';

class GetLocationDataProvider {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  Future<Location> checkLocation() async {
    final LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      print(permission);
      final Position position = await _geolocatorPlatform.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      return Location(coordinates: [position.latitude, position.longitude]);
    } else {
      throw Exception();
    }
  }
}
