import 'dart:io';

import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/constants/networkpath.dart';
import 'package:matchangoo/core/init/network/network_manager.dart';

abstract class CheckIfAlreadyRegistratedDScontract {
  Future<bool> checkIfAlreadyRegistratedDS(String email);
}

class CheckIfAlreadyRegisteredDS implements CheckIfAlreadyRegistratedDScontract {
  @override
  Future<bool> checkIfAlreadyRegistratedDS(String email) async {
    final response = await NetworkManager.instance.dio.post(NetworkPath.CHECKIFREGISTRATED, data: {'email': email});
    if (response.statusCode == HttpStatus.ok) {
      final status = response.data['status'];
      if (status == 'notregistered') {
        return false;
      } else if (status == 'registered') {
        return true;
      } else {
        throw UnexpectedException();
      }
    } else {
      throw ServerException();
    }
  }
}
