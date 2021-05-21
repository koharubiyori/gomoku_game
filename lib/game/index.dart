import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:gomoku_game/game/draw/drawBackground.dart';
import 'package:gomoku_game/game/pieces.dart';

class GomokuGame extends Game {
  late Size screenSize;
  
  
  List<List<Pieces>> piecesList = [];
  late Offset lastPiecesPosition;

  GomokuGame() {
    for (int i=0; i < 15; i++) {
      piecesList.add([]);
    }
  }

  addPieces(int x, int y, GameSide side) {
    piecesList[y][x] = Pieces(this, side: side, x: x, y: y);
  }

  @override
  render(Canvas canvas) {    
    drawBackground(canvas, screenSize);
    this.piecesList.forEach((row) {
      row.forEach((pieces) => pieces.render(canvas));
    });
  }

  @override
  void update(double t) {
    
  }

  @override
  void resize(Size size) async {
    screenSize = size;
    super.resize(size);
  }
}