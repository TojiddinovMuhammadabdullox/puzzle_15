import 'package:equatable/equatable.dart';

class PuzzleState extends Equatable {
  final List<int> tiles;
  final int moves;
  final bool isComplete;

  const PuzzleState({
    required this.tiles,
    required this.moves,
    required this.isComplete,
  });

  @override
  List<Object> get props => [tiles, moves, isComplete];

  PuzzleState copyWith({
    List<int>? tiles,
    int? moves,
    bool? isComplete,
  }) {
    return PuzzleState(
      tiles: tiles ?? this.tiles,
      moves: moves ?? this.moves,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
