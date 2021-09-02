import 'dart:io';

import '../../../../core/init/network/network_manager.dart';
import '../../../../core/result_error/errors/custom_error.dart';
import '../models/interests/interest_response.dart';

abstract class InterestDataSourceContract {
  Future<InterestResponse> getInterests();
}

class InterestDataSource implements InterestDataSourceContract {
  @override
  Future<InterestResponse> getInterests() async {
    final response = await NetworkManager.instance.dio.get('/interests');
    if (response.statusCode == HttpStatus.ok) {
      print(response.data);
      return InterestResponse.fromJson(response.data);
    } else {
      print(response.statusCode);
      print('status burda');
      print(response.data);
      throw CustomError(errorCode: response.statusCode ?? 500);
    }
  }
}
