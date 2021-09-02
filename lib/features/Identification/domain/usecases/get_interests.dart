import '../../../../core/result_error/result_freezed/result.dart';
import '../../data/models/interests/interest_response.dart';
import '../../data/repositories/interest_repositary_impl.dart';

class GetAllInterests {
  final InterestRepositary interestRepositary;
  GetAllInterests({required this.interestRepositary});

  Future<Result<InterestResponse>> call() async => await interestRepositary.getInterests();
}
