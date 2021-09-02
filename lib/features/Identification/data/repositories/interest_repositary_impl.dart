import 'package:dio/dio.dart';
import '../../../../core/result_error/errors/custom_error.dart';
import '../datasources/interest_datasource.dart';
import '../models/interests/interest_response.dart';
import '../../../../core/result_error/result_freezed/result.dart';
import '../../domain/repositories/interest_repositary_contract.dart';

class InterestRepositary implements InterestRepositaryContract {
  final InterestDataSource interestDataSource;
  InterestRepositary({required this.interestDataSource});

  @override
  Future<Result<InterestResponse>> getInterests() async {
    try {
      InterestResponse interestResponse = await interestDataSource.getInterests();
      return Result.success(interestResponse);
    } on CustomError {
      return Result.error(CustomError(errorCode: 500));
    } catch (e) {
      print(e);
      return Result.error(CustomError());
    }
  }
}
