import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:proyecto_ubb/models/user_model.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [UserSchema],
        directory: dir.path,
        inspector: true,
      );

      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<User?> getUser() async {
    final isar = await db;
    final user = isar.users.where().findFirst();

    return user;
  }

  Future<void> setName(String nombre) async {
    final isar = await db;
    User user = User(id: 0, nombre: nombre);

    isar.writeTxnSync<int>(() => isar.users.putSync(user));
  }
}
