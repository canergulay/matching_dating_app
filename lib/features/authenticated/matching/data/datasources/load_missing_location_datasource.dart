import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/appetizers/global_models/location.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/constants/networkpath.dart';
import 'package:matchangoo/core/init/network/network_manager.dart';

class LoadMissingLocationDataSource {
  Future<void> loadMissingLocation(Location location) async {
    final locationData = location.toJson();
    final response = await NetworkManager.instance.dio.post(NetworkPath.shared.LOADLOCATION, data: locationData);
    if (response.statusCode != 200) {
      throw UnexpectedException();
    }
  }
}
