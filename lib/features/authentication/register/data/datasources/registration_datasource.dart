import 'dart:io';

import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/appetizers/global_models/tokens.dart';
import 'package:matchangoo/core/constants/networkpath.dart';
import 'package:matchangoo/core/init/network/network_manager.dart';
import 'package:matchangoo/features/Identification/domain/entities/registration_entity.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';

class RegistrationDataSource {
  Future<UserModel?> registration(RegistrationEntity registrationEntity) async {
    final response = await NetworkManager.instance.dio.post(NetworkPath.shared.REGISTER, data: registrationEntity.toJson());
    if (response.statusCode == HttpStatus.ok) {
      if (response.data['status'] == "success") {
        if (response.data['user'] != null) {
          final Tokens tokens = Tokens.fromJson(response.data['tokens']);
          NetworkManager.instance.setTokens(tokens);
          return UserModel.fromJson(response.data['user']);
        } else {
          throw CantRegister();
        }
      } else if (response.data.status == "alreadyregistered") {
        throw AlreadyRegistered();
      }
    } else {
      throw ServerException();
    }
  }
}
