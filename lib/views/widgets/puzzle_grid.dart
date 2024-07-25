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
          padding: const EdgeInsets.all(16),
          itemCount: 16,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final tile = state.tiles[index];
            return GestureDetector(
              onTap: () =>
                  PuzzleController(context.read<PuzzleBloc>()).moveTile(tile),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: tile == 0 ? Colors.transparent : Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: tile == 0
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                ),
                child: Center(
                  child: Text(
                    tile == 0 ? '' : tile.toString(),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
