import 'package:matchangoo/core/appetizers/global_models/location.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';

abstract class GetLocationRepositaryContract {
  Future<Result<Location>> getLocation();
}
