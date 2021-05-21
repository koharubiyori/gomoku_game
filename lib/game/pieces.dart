import 'dart:ui';

import 'package:gomoku_game/game/index.dart';

class Pieces {
  final GomokuGame game;
  final GameSide side;
  final int x;
  final int y;

  const Pieces(this.game, {
    required this.side,
    required this.x,
    required this.y
  });

  void update(double t) {

  }

  void render(Canvas canvas) {

  }
}

enum GameSide {
  Black, Write
}