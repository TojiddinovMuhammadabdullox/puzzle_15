import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_15/controller/puzzle_controller.dart';
import '../../bloc/puzzle_bloc.dart';
import '../../bloc/puzzle_state.dart';

class PuzzleGrid extends StatelessWidget {
  const PuzzleGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleBloc, PuzzleState>(
      builder: (context, state) {
        return GridView.builder(
          itemCount: 16,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            final tile = state.tiles[index];
            return GestureDetector(
              onTap: () =>
                  PuzzleController(context.read<PuzzleBloc>()).moveTile(tile),
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: tile == 0 ? Colors.white : Colors.blue,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    tile == 0 ? '' : tile.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      color: tile == 0 ? Colors.transparent : Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
