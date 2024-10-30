import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'models/models.dart';

class KeyValueStorage {
  static const userBoxKey = 'user';

  KeyValueStorage({@visibleForTesting HiveInterface? hive})
      : _hive = hive ?? Hive {
    try {
      _hive.registerAdapter(UserLmAdapter());
    } catch (_) {
      throw Exception(
          'You are not allowed to have multiple instances of [KeyValueStorage]');
    }
  }

  final HiveInterface _hive;

  Future<Box<UserLm>> get userBox => _openHiveBox<UserLm>(userBoxKey);

  Future<Box<T>> _openHiveBox<T>(String boxKey) async {
    if (!_hive.isBoxOpen(boxKey)) {
      return await _hive.openBox<T>(boxKey);
    }
    return _hive.box<T>(boxKey);
  }
}
