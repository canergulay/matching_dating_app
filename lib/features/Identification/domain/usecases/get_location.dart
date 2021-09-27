import 'package:matchangoo/core/appetizers/global_models/location.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/Identification/data/repositories/get_location_repositary_impl.dart';
import 'package:matchangoo/features/Identification/domain/repositories/get_location_repositary_contract.dart';

class GetLocation {
  final GetLocationRepositary getLocationRepositary;
  GetLocation({required this.getLocationRepositary});
  Future<Result<Location>> call() async {
    return await getLocationRepositary.getLocation();
  }
}
