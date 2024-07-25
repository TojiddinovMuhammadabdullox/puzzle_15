import 'package:equatable/equatable.dart';

abstract class PuzzleEvent extends Equatable {
  const PuzzleEvent();

  @override
  List<Object> get props => [];
}

class StartGame extends PuzzleEvent {}

class MoveTile extends PuzzleEvent {
  final int tile;

  const MoveTile(this.tile);

  @override
  List<Object> get props => [tile];
}

class SurrenderGame extends PuzzleEvent {}
