import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_15/controller/puzzle_controller.dart';
import 'package:puzzle_15/views/widgets/puzzle_grid.dart';
import '../bloc/puzzle_bloc.dart';
import '../bloc/puzzle_state.dart';

class PuzzlePage extends StatelessWidget {
  const PuzzlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '15 Puzzle',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 15),
        child: Column(
          children: [
            BlocBuilder<PuzzleBloc, PuzzleState>(
              builder: (context, state) {
                return Text(
                  'Yurishlar: ${state.moves}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            Expanded(
              child: Container(
                child: const PuzzleGrid(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      final controller =
                          PuzzleController(context.read<PuzzleBloc>());
                      controller.surrenderGame();
                      _showSurrenderDialog(context);
                    },
                    child: const Text(
                      "Tugatish",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      final controller =
                          PuzzleController(context.read<PuzzleBloc>());
                      controller.startGame();
                    },
                    child: const Text(
                      "Qayta boshlash",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showSurrenderDialog(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Image.asset("assets/game_over.gif"),
        );
      },
    );
  }
}
