import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/constants/networkpath.dart';
import 'package:matchangoo/core/init/network/network_manager.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';

class CheckIfAccountExistDataSource {
  Future<UserModel> checkIfAccountExist({required String email}) async {
    final response = await NetworkManager.instance.dio.post(NetworkPath.CHECKIACCEXIST, data: {'email': email});
    if (response.statusCode == 200) {
      var status = response.data['status'];
      if (status == true) {
        var user = response.data['user'];
        print(user);

        return UserModel.fromJson(user);
      } else if (status == false) {
        throw NoAccount();
      } else {
        throw UnexpectedException();
      }
    } else {
      throw ServerException();
    }
  }
}
