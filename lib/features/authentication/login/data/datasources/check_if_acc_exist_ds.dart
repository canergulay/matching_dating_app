import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/appetizers/global_models/tokens.dart';
import 'package:matchangoo/core/constants/networkpath.dart';
import 'package:matchangoo/core/init/network/network_manager.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';

class CheckIfAccountExistDataSource {
  Future<UserModel> checkIfAccountExist({required String email}) async {
    final response = await NetworkManager.instance.dio.post(NetworkPath.shared.CHECKIACCEXIST, data: {'email': email});
    if (response.statusCode == 200) {
      final status = response.data['status'];
      if (status == true) {
        print(response.data);
        final user = response.data['user'];
        final Tokens tokens = Tokens.fromJson(response.data['tokens']);
        NetworkManager.instance.setTokens(tokens);
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
