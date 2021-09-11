import 'package:matchangoo/features/Identification/data/models/interest_type.dart';
import 'package:matchangoo/features/Identification/data/models/interests/interests.dart';
import '../../../../core/result_error/errors/custom_error.dart';
import '../datasources/interest_datasource.dart';
import '../../../../core/result_error/result_freezed/result.dart';
import '../../domain/repositories/interest_repositary_contract.dart';

class InterestRepositary implements InterestRepositaryContract {
  final InterestDataSource interestDataSource;
  InterestRepositary({required this.interestDataSource});

  @override
  Future<Result<List<Interests>>> getInterests({required InterestType type}) async {
    try {
      List<Interests> interestResponse = await interestDataSource.getInterests(type: type);
      return Result.success(interestResponse);
    } on CustomError {
      return Result.error(CustomError(errorCode: 500));
    } catch (e) {
      print(e);
      return Result.error(CustomError());
    }
  }
}
