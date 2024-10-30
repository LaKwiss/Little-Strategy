import 'package:board_game/board_game.dart';
import 'package:flutter/material.dart';
import 'package:key_value_storage/key_value_storage.dart';
import 'package:provider/provider.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
            create: (context) =>
                UserRepository(keyValueStorage: KeyValueStorage())),
        ChangeNotifierProvider(
          create: (context) => CellListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              UserProvider(repository: context.read<UserRepository>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
          appBarTheme: AppBarTheme.of(context).copyWith(
            color: Colors.blue,
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
        title: 'Little Strategy Game',
        routes: {
          '/': (context) => const LoginScreen(),
          '/game': (context) => const BoardRunning(),
        },
      ),
    );
  }
}
