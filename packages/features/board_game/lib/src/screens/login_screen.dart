import 'package:board_game/src/providers/user_list_provider.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _usernameEditingController;
  late final TextEditingController _passwordController;

  late final bool userExists;

  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  void _onLogin() {
    if (_usernameEditingController.text.isEmpty || _passwordController.text.isEmpty) {
      return;
    }

    userExists =
        context.read<UserListProvider>().findUserByUsername(_usernameEditingController.text) !=
            null;

    if (!userExists) {
      context.read<UserListProvider>().addUser(
            User(
              username: _usernameEditingController.text,
              password: _passwordController.text,
            ),
          );
    } else {
      final User? user =
          context.read<UserListProvider>().findUserByUsername(_usernameEditingController.text);
      if (user == null) {
        return;
      }
      if (user.password != _passwordController.text) {
        return;
      }
    }
    Navigator.of(context).pushNamed('/game');
  }

  @override
  void initState() {
    super.initState();
    _usernameEditingController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();

    _usernameEditingController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(400),
        child: Column(
          children: [
            TextFormField(
              controller: _usernameEditingController,
              focusNode: _usernameFocusNode,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FilledButton.tonalIcon(
                onPressed: () {
                  _onLogin();
                },
                label: const Text('Play as anonymous'),
                icon: const Icon(
                  Icons.person,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
