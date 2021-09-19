import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';

abstract class LoginRepositaryContract {
  Future<Result<UserModel>> login(String email, String password);
  Future<void> loginViagoogle();
  Future<void> loginViafacebook();
}
