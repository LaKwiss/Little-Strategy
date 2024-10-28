import 'package:board_game/src/providers/user_list_provider.dart';
import 'package:board_game/src/screens/board_running.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _usernameEditingController;
  late final TextEditingController _passwordController;

  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  void _onLogin() {
    final isValid = _formKey.currentState?.validate();

    if (!isValid!) {
      return;
    }

    if (_usernameEditingController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      return;
    }

    if (context
        .read<UserListProvider>()
        .checkIfUserExists(_usernameEditingController.text)) {
      final user = context
          .read<UserListProvider>()
          .findUserById(_usernameEditingController.text);
      if (user.password != _passwordController.text) {
        return;
      }
    } else {
      context.read<UserListProvider>().addUser(
            User(
              username: _usernameEditingController.text,
              password: _passwordController.text,
            ),
          );
    }

    _formKey.currentState?.save();
    // Navigator.of(context).pushNamed('/game');
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
        child: Form(
          key: _formKey,
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
                  icon: const Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
