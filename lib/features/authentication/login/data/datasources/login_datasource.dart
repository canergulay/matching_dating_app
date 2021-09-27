import 'dart:io';

import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/appetizers/global_models/tokens.dart';
import 'package:matchangoo/core/constants/error_constants.dart';
import 'package:matchangoo/core/constants/networkpath.dart';
import 'package:matchangoo/core/init/network/network_manager.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';

abstract class LoginDataSourceContract {
  Future<UserModel> loginService({required String email, required String password});
}

class LoginDataSource implements LoginDataSourceContract {
  @override
  Future<UserModel> loginService({required String email, required String password}) async {
    final response = await NetworkManager.instance.dio.post(NetworkPath.shared.LOGIN, data: {'email': email, 'password': password});
    if (response.statusCode == HttpStatus.ok) {
      if (response.data['status'] == ErrorConstants.shared.verified) {
        final userResponse = response.data['user'];
        final Tokens tokens = Tokens.fromJson(response.data['tokens']);
        NetworkManager.instance.setTokens(tokens);

        return UserModel.fromJson(userResponse);
      } else if (response.data['status'] == ErrorConstants.shared.wrongPassword) {
        throw WrongPassword();
      } else if (response.data['status'] == ErrorConstants.shared.notAnAccount) {
        throw NoAccount();
      } else {
        throw UnexpectedException();
      }
    } else {
      throw ServerException();
    }
  }
}
