import 'package:key_value_storage/key_value_storage.dart';

class UserLocalStorage {
  static const userNode = 'user';

  UserLocalStorage({required this.keyValueStorage});

  final KeyValueStorage keyValueStorage;
}
