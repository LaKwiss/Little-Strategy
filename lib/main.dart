import 'package:board_game/board_game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CellListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
          appBarTheme: AppBarTheme.of(context).copyWith(color: Colors.blue),
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
