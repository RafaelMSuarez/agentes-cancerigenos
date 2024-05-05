import 'package:isar/isar.dart';
part 'user_model.g.dart';

@collection
class User {
  Id? id;
  String? nombre;

  User({this.id, this.nombre});
}

// dart run build_runner build
