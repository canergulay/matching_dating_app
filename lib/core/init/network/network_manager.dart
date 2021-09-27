import 'package:dio/dio.dart';
import 'package:matchangoo/core/appetizers/global_models/tokens.dart';
import '../../constants/app_constants.dart';

class NetworkManager {
  static NetworkManager _instace = NetworkManager._init();
  static NetworkManager get instance => _instace;

  late Dio dio;
  late Tokens? tokens;

  setTokens(Tokens tokens) {
    this.tokens = tokens;
    _initDioWithBase(tokens.access);
  }

  NetworkManager._init() {
    _initDioWithBase(null);
  }

  BaseOptions dioCustomBaseOptions(String? accessToken) {
    return BaseOptions(
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer ${accessToken}'},
      baseUrl: AppConstants.shared.BASE_URL,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
  }

  void _initDioWithBase(String? accessToken) {
    BaseOptions dioBaseOptions = dioCustomBaseOptions(accessToken);
    dio = Dio(dioBaseOptions);
  }
}
