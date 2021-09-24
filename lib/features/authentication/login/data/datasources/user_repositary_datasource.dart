import 'dart:io';

import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/constants/networkpath.dart';
import 'package:matchangoo/core/init/network/network_manager.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';

class UserDataSource {
  Future<UserModel?> getUserByToken(String token) async {
    final response = await NetworkManager.instance.dio.post(NetworkPath.shared.GETUSERBYTOKEN, data: {'token': token});
    if (response.statusCode == HttpStatus.ok) {
      final UserModel? user = response.data['user'];
      if (user == null) throw UnexpectedException();
      return user;
    } else if (response.statusCode == HttpStatus.unauthorized) {
      throw UnAuthorized();
    } else {
      throw ServerException();
    }
  }
}
