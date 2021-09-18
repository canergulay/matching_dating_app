import 'package:matchangoo/core/result_error/result_freezed/result.dart';

abstract class CheckIfAlreadyRegistratedContarct {
  Future<Result<bool>> checkIfAlreadyRepositary(String email);
}
