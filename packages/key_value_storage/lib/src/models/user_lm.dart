import 'package:hive/hive.dart';

part 'user_lm.g.dart';

@HiveType(typeId: 0)
class UserLm {
  UserLm({
    required this.username,
    required this.password,
  });

  @HiveField(0)
  final String username;
  @HiveField(1)
  final String password;

  factory UserLm.fromJson(Map<String, dynamic> json) => UserLm(
        username: json['username'],
        password: json['password'],
      );
}
