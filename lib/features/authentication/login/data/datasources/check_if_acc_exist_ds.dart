import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/constants/networkpath.dart';
import 'package:matchangoo/core/init/network/network_manager.dart';

class CheckIfAccountExistDataSource {
  Future<bool> checkIfAccountExist({required String email}) async {
    final response = await NetworkManager.instance.dio.post(NetworkPath.CHECKIACCEXIST, data: {'email': email});
    if (response.statusCode == 200) {
      if (response.data['status'] = true) {
        return true;
      } else if (response.data['status'] = false) {
        return false;
      } else {
        throw UnexpectedException();
      }
    } else {
      throw ServerException();
    }
  }
}
