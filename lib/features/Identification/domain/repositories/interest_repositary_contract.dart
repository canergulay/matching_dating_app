import '../../../../core/result_error/result_freezed/result.dart';
import '../../data/models/interests/interest_response.dart';

abstract class InterestRepositaryContract {
  Future<Result<InterestResponse>> getInterests();
}
