import 'package:matchangoo/core/appetizers/global_models/location.dart';
import 'package:matchangoo/core/init/network/network_manager.dart';

abstract class LoadMissingLocationRepoContract {
  Future<void> loadMissing(Location location);
}
