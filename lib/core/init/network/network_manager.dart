import 'package:dio/dio.dart';
import 'package:matchangoo/core/constants/app_constants.dart';

class NetworkManager {
  static NetworkManager _instace = NetworkManager._init();
  static NetworkManager get instance => _instace;

  Dio? dioInstance;

  NetworkManager._init() {
    BaseOptions dioBaseOptions = BaseOptions(baseUrl: AppConstants.BASE_URL);
    dioInstance = Dio(dioBaseOptions);
  }
}
