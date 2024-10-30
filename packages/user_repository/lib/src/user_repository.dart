import 'package:key_value_storage/key_value_storage.dart';
import 'package:flutter/material.dart';
import 'user_local_storage.dart';

class UserRepository {
  UserRepository(
      {required KeyValueStorage keyValueStorage,
      @visibleForTesting UserLocalStorage? localStorage})
      : _localStorage =
            localStorage ?? UserLocalStorage(keyValueStorage: keyValueStorage);

  final UserLocalStorage _localStorage;
}
