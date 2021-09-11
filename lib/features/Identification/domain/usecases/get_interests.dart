import 'package:matchangoo/features/Identification/data/models/interest_type.dart';
import 'package:matchangoo/features/Identification/data/models/interests/interests.dart';

import '../../../../core/result_error/result_freezed/result.dart';

import '../../data/repositories/interest_repositary_impl.dart';

class GetAllInterests {
  final InterestRepositary interestRepositary;
  GetAllInterests({required this.interestRepositary});

  Future<Result<List<Interests>>> call({required InterestType type}) async => await interestRepositary.getInterests(type: type);
}
