import 'dart:ui';

import 'package:flutter/material.dart';
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
    final circlleOffset = this.game.layout.gridOffsets[this.y][this.x];
    final paint = Paint();
    paint.color = side == GameSide.Black ? Colors.black : Colors.white;
  
    canvas.drawCircle(circlleOffset, 10, paint);
  }
}

enum GameSide {
  Black, Write
}