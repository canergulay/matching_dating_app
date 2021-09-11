import 'dart:io';

import 'package:matchangoo/core/constants/app_constants.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/Identification/data/models/interest_type.dart';
import 'package:matchangoo/features/Identification/data/models/interests/interests.dart';

import '../../../../core/init/network/network_manager.dart';
import '../../../../core/result_error/errors/custom_error.dart';

abstract class InterestDataSourceContract {
  Future<List<Interests>> getInterests({required InterestType type});
}

class InterestDataSource implements InterestDataSourceContract {
  @override
  Future<List<Interests>> getInterests({required InterestType type}) async {
    final String? backendtype = interestTypeBackendCodes[type];
    final response = await NetworkManager.instance.dio.post('/interests', data: {'type': backendtype});
    if (response.statusCode == HttpStatus.ok) {
      print('0');

      print(response.data);
      if (response.data is List) {
        print('1');

        List<Interests> interests = (response.data as List).map((e) => Interests.fromJson(e)).toList();
        return interests;
      } else {
        print('2');

        print(response.data);
        throw CustomError(errorCode: 404, message: 'List is empty!');
      }
      // return InterestResponse.fromJson(response.data);
    } else {
      print('3');
      print(response.statusCode);
      print('status burda');
      print(response.data);
      throw CustomError(errorCode: response.statusCode ?? 500);
    }
  }
}
