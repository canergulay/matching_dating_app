import 'package:matchangoo/features/Identification/data/models/interest_type.dart';
import 'package:matchangoo/features/Identification/data/models/interests/interests.dart';

import '../../../../core/result_error/result_freezed/result.dart';

abstract class InterestRepositaryContract {
  Future<Result<List<Interests>>> getInterests({required InterestType type});
}
