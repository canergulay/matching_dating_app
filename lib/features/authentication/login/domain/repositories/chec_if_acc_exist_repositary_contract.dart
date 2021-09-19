import 'package:matchangoo/core/result_error/result_freezed/result.dart';

abstract class CheckIfAccountExistRepositaryContract {
  Future<Result<bool>> checkIfAccountExist({required String email});
}
