import 'package:domain_entities/domain_entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_list_state.dart';

class UserListProvider with ChangeNotifier {
  UserListState _state = UserListState.initial();
  UserListState get state => _state;

  void addUser(User user) {
    _state = _state.copyWith(users: [..._state.users, user]);
    notifyListeners();
  }

  void updateUser(User updatedUser) {
    final newUsers = _state.users.map((User user) {
      if (user.username == updatedUser.username) {
        return User(
          username: user.username,
          password: updatedUser.password,
        );
      }
      return user;
    }).toList();

    _state = _state.copyWith(users: newUsers);
    notifyListeners();
  }

  bool checkIfUserExists(String username) {
    return _state.users
        .any((User user) => user.id == findUserIdByUsername(username));
  }

  User findUserById(String id) {
    return _state.users.firstWhere((User user) => user.id == id);
  }

  void deleteUser(String id) {
    final newUsers = _state.users.where((User user) => user.id != id).toList();
    _state = _state.copyWith(users: newUsers);
    notifyListeners();
  }

  void clearUsers() {
    _state = _state.copyWith(users: []);
    notifyListeners();
  }

  String findUserIdByUsername(String username) {
    return _state.users.firstWhere((User user) => user.username == username).id;
  }
}