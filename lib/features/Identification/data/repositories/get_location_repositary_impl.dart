import 'package:matchangoo/core/appetizers/global_models/location.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/Identification/data/datasources/get_location_local_dataprovider.dart';
import 'package:matchangoo/features/Identification/domain/repositories/get_location_repositary_contract.dart';

class GetLocationRepositary implements GetLocationRepositaryContract {
  final GetLocationDataProvider getLocationDataProvider;
  GetLocationRepositary({required this.getLocationDataProvider});
  @override
  Future<Result<Location>> getLocation() async {
    // TODO: implement getLocation
    try {
      final Location location = await getLocationDataProvider.checkLocation();
      return Result.success(location);
    } catch (e) {
      print(e);
      return Result.error(CustomError(message: 'sasa'));
    }
  }
}
