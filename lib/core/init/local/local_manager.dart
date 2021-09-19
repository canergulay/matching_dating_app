import 'package:hive/hive.dart';

class LocalManager {
  static LocalManager _instace = LocalManager._init();
  static LocalManager get instance => _instace;

  LocalManager._init();

  Future<String?> get({required String key, required String boxName}) async {
    var box = await Hive.openBox(boxName);
    box.get(key);
    box.close();
  }
}
