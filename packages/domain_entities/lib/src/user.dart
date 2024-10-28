import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid _uuid = Uuid();

class User extends Equatable {
  User({
    required this.username,
    required this.password,
    String? id,
  }) : id = id ?? _uuid.v6();

  final String username;
  final String password;
  final String id;

  @override
  List<Object?> get props => [
        username,
        password,
        id,
      ];

  @override
  bool get stringify => true;
}
