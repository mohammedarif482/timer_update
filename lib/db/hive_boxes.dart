import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../model/users_model.dart';
import 'package:path_provider/path_provider.dart';

class Boxes {
  static Box<List<Users>> getUsers() => Hive.box<List<Users>>('users');

  static dynamic clearUsers() => Hive.box<List<Users>>("users").clear();

  static Future<void> openBoxes() async {
    await Hive.openBox<List<Users>>('users');
  }

  static Future<void> configHiveBoxes() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();

    await Hive.initFlutter();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(UsersAdapter());
  }
}
