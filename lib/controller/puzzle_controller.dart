import '../bloc/puzzle_bloc.dart';
import '../bloc/puzzle_event.dart';

class PuzzleController {
  final PuzzleBloc puzzleBloc;

  PuzzleController(this.puzzleBloc);

  void startGame() {
    puzzleBloc.add(StartGame());
  }

  void moveTile(int tile) {
    puzzleBloc.add(MoveTile(tile));
  }

  void surrenderGame() {
    puzzleBloc.add(SurrenderGame());
  }
}
