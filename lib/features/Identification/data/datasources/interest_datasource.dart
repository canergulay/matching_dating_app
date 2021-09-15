import 'dart:io';

import '../../../../core/init/network/network_manager.dart';
import '../../../../core/result_error/errors/custom_error.dart';
import '../models/interest_type.dart';
import '../models/interests/interests.dart';

abstract class InterestDataSourceContract {
  Future<List<Interests>> getInterests({required InterestType type});
}

class InterestDataSource implements InterestDataSourceContract {
  @override
  Future<List<Interests>> getInterests({required InterestType type}) async {
    final String? backendtype = interestTypeBackendCodes[type];
    final response = await NetworkManager.instance.dio.post('/interests', data: {'type': backendtype});
    if (response.statusCode == HttpStatus.ok) {
      if (response.data is List) {
        final List<Interests> interests = (response.data as List<Map<String, dynamic>>).map((e) => Interests.fromJson(e)).toList();
        return interests;
      } else {
        throw CustomError(errorCode: 404, message: 'List is empty!');
      }
      // return InterestResponse.fromJson(response.data);
    } else {
      throw CustomError(errorCode: response.statusCode ?? 500);
    }
  }
}
