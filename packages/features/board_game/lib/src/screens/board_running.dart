import 'package:board_game/src/providers/cell_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoardRunning extends StatefulWidget {
  const BoardRunning({super.key});

  @override
  State<BoardRunning> createState() => _BoardRunningState();
}

class _BoardRunningState extends State<BoardRunning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings screen
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Exit the board game
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // Show information about the board game
            },
          ),
        ],
        title: const Text('Little Strategy Game'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.home_filled,
          ),
        ),
      ),
      body: Center(
        child: Text(
          context.watch<CellListProvider>().state.cells.length.toString(),
        ),
      ),
    );
  }
}
