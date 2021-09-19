import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';
import 'package:matchangoo/features/authentication/login/data/repositories/login_repositary_implementation.dart';

class Login {
  final LoginRepositary loginRepositary;
  Login({required this.loginRepositary});
  Future<Result<UserModel>> call({required String email, required String password}) async {
    return await loginRepositary.login(email: email, password: password);
  }
}
