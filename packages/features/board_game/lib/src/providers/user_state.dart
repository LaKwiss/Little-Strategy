part of 'user_provider.dart';

class UserState extends Equatable {
  const UserState({
    required this.users,
    this.user,
  });

  final List<User> users;
  final User? user;

  factory UserState.initial() {
    return UserState(
      user: null,
      users: [
        User(
          username: 'User1',
          password: '1234',
        ),
        User(
          username: 'User2',
          password: '1234',
        ),
        User(
          username: 'User3',
          password: '1234',
        ),
      ],
    );
  }

  @override
  List<Object?> get props => [users];

  UserState copyWith({User? user, List<User>? users}) {
    return UserState(
      users: users ?? this.users,
      user: user ?? this.user,
    );
  }

  @override
  bool? get stringify => true;
}
