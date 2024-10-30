import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/foundation.dart';
import 'package:key_value_storage/key_value_storage.dart';

class UserLocalStorage {
  static const userNode = 'user';

  UserLocalStorage({required this.keyValueStorage});

  final KeyValueStorage keyValueStorage;

  Future<void> addUser(User u) async {
    await keyValueStorage.userBox.then((box) {
      box.clear();
      box.put(userNode, UserLm(username: u.username, password: u.password));
      if (kDebugMode) {
        print(box.get(userNode));
      }
    });
  }

  Future<List<User>> getAllUsers() async {
    final List<User> users = [];
    await keyValueStorage.userBox.then((box) {
      final UserLm? user = box.get(userNode);
      if (user != null) {
        users.add(User(username: user.username, password: user.password));
      }
    });
    return users;
  }
}
