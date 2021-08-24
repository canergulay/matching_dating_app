import 'package:dio/dio.dart';
import 'package:matchangoo/core/constants/app_constants.dart';

class NetworkManager {
  static NetworkManager _instace = NetworkManager._init();
  static NetworkManager get instance => _instace;

  late Dio dio;

  NetworkManager._init() {
    BaseOptions dioBaseOptions = BaseOptions(
      headers: {
        'Content-Type': 'application/json',
      },
      baseUrl: AppConstants.BASE_URL,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
    dio = Dio(dioBaseOptions);
  }
}
