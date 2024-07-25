import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_15/bloc/puzzle_event.dart';
import 'package:puzzle_15/views/puzzlee_page.dart';
import 'bloc/puzzle_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => PuzzleBloc()..add(StartGame()),
        child: PuzzlePage(),
      ),
    );
  }
}
