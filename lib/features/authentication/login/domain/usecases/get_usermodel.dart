import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';
import 'package:matchangoo/features/authentication/login/data/repositories/user_repositary_implementation.dart';

class GetUserByToken {
  final UserRepositary userRepositary;
  GetUserByToken({required this.userRepositary});

  Future<Result<UserModel?>> call(String token) async => await userRepositary.getUserByToken(token);
}
