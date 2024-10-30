import 'package:domain_entities/domain_entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

part 'user_state.dart';

class UserProvider with ChangeNotifier {
  UserState _state = UserState.initial();
  UserState get state => _state;

  UserProvider({required this.repository});

  final UserRepository repository;

  void addUser(User user) async {
    _state = _state.copyWith(users: [..._state.users, user]);
    _state = _state.copyWith(user: user);

    await repository.addUser(user);

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

  // bool checkIfUserExists(String username) {
  //   return _state.users.any((User user) => user.id == findUserIdByUsername(username));
  // }

  void deleteUser(String id) {
    final newUsers = _state.users.where((User user) => user.id != id).toList();
    _state = _state.copyWith(users: newUsers);
    notifyListeners();
  }

  void clearUsers() {
    _state = _state.copyWith(users: []);
    notifyListeners();
  }

  String? findUserIdByUsername(String username) {
    try {
      return _state.users
          .firstWhere((User user) => user.username == username)
          .id;
    } catch (e) {
      return null;
    }
  }

  User? findUserByUsername(String username) {
    try {
      return _state.users.firstWhere((User user) => user.username == username);
    } catch (e) {
      return null;
    }
  }

  User? findUserById(String id) {
    try {
      return _state.users.firstWhere((User user) => user.id == id);
    } catch (e) {
      return null;
    }
  }
}
