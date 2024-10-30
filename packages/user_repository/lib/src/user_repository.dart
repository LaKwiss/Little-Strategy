import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/foundation.dart';
import 'package:key_value_storage/key_value_storage.dart';
import 'user_local_storage.dart';

class UserRepository {
  UserRepository(
      {required KeyValueStorage keyValueStorage,
      @visibleForTesting UserLocalStorage? localStorage})
      : _localStorage =
            localStorage ?? UserLocalStorage(keyValueStorage: keyValueStorage);

  final UserLocalStorage _localStorage;

  Future<void> addUser(User user) async {
    await _localStorage.addUser(user);

    List<User> content = await _localStorage.getAllUsers();

    if (kDebugMode) {
      print("Contenu de la box : $content");
    }
  }
}
