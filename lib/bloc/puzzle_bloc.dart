import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_15/bloc/puzzle_event.dart';
import 'package:puzzle_15/bloc/puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc()
      : super(PuzzleState(
            tiles: List.generate(16, (index) => index),
            moves: 0,
            isComplete: false)) {
    on<StartGame>(_onStartGame);
    on<MoveTile>(_onMoveTile);
    on<SurrenderGame>(_onSurrenderGame);
  }

  void _onStartGame(StartGame event, Emitter<PuzzleState> emit) {
    final shuffledTiles = List<int>.from(state.tiles)..shuffle();
    emit(state.copyWith(tiles: shuffledTiles, moves: 0, isComplete: false));
  }

  void _onMoveTile(MoveTile event, Emitter<PuzzleState> emit) {
    final tiles = List<int>.from(state.tiles);
    final index = tiles.indexOf(event.tile);
    final emptyIndex = tiles.indexOf(0);

    if (_canMove(index, emptyIndex)) {
      tiles[emptyIndex] = event.tile;
      tiles[index] = 0;

      emit(state.copyWith(tiles: tiles, moves: state.moves + 1));

      if (_isComplete(tiles)) {
        emit(state.copyWith(isComplete: true));
      }
    }
  }

  void _onSurrenderGame(SurrenderGame event, Emitter<PuzzleState> emit) {
    final orderedTiles = List.generate(16, (index) => index);
    emit(state.copyWith(tiles: orderedTiles, isComplete: false));
  }

  bool _canMove(int index, int emptyIndex) {
    final row = (index / 4).floor();
    final emptyRow = (emptyIndex / 4).floor();
    final column = index % 4;
    final emptyColumn = emptyIndex % 4;

    return (row == emptyRow && (column - emptyColumn).abs() == 1) ||
        (column == emptyColumn && (row - emptyRow).abs() == 1);
  }

  bool _isComplete(List<int> tiles) {
    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i] != i) return false;
    }
    return true;
  }
}
