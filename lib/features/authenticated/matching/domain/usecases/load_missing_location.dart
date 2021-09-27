import 'package:matchangoo/core/appetizers/global_models/location.dart';
import 'package:matchangoo/features/authenticated/matching/data/repositories/load_missing_location.dart';

class LoadMissingLocation {
  final LoadMissingLocationRepositary loadMissingLocationRepositary;
  LoadMissingLocation({required this.loadMissingLocationRepositary});
  Future<void> call(Location location, String userid) async => await loadMissingLocationRepositary.loadMissing(location, userid);
}
