import 'package:matchangoo/core/appetizers/global_models/location.dart';
import 'package:matchangoo/features/authenticated/matching/data/datasources/load_missing_location_datasource.dart';
import 'package:matchangoo/features/authenticated/matching/domain/repositories/load_missing_location_repo_contract.dart';

class LoadMissingLocationRepositary implements LoadMissingLocationRepoContract {
  final LoadMissingLocationDataSource loadMissingLocationDataSource;
  LoadMissingLocationRepositary({required this.loadMissingLocationDataSource});
  @override
  Future<void> loadMissing(Location location) async {
    try {
      await loadMissingLocationDataSource.loadMissingLocation(location);
    } catch (e) {
      // FOR NOW WE WILL NOT DO ANYTHING TO RESOLVE.
    }
  }
}
