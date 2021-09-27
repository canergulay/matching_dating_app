import 'package:matchangoo/core/appetizers/global_models/location.dart';

abstract class LoadMissingLocationRepoContract {
  Future<void> loadMissing(Location location, String userid);
}
