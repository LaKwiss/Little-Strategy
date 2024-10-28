part of 'user_list_provider.dart';

class UserListState extends Equatable {
  const UserListState({
    required this.users,
  });

  final List<User> users;

  factory UserListState.initial() {
    return UserListState(
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

  UserListState copyWith({List<User>? users}) {
    return UserListState(
      users: users ?? this.users,
    );
  }

  @override
  bool? get stringify => true;
}
