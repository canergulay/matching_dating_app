import 'dart:io';

import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
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
