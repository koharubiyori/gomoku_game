import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:gomoku_game/game/draw/drawBackground.dart';
import 'package:gomoku_game/game/pieces.dart';

class GomokuGame extends Game with TapDetector {
  late Size screenSize;
  late BoardLayout layout;
  List<List<Pieces?>> piecesList = List.generate(15, (index) => List.filled(15, null));
  late Offset lastPiecesPosition;

  @override
  onTapUp(TapUpDetails details) {
    underPiecesHandler(details);
  }

  void underPiecesHandler(TapUpDetails details) {
    final position = details.globalPosition; 
    if (position.dy < layout.gridRect.top - 10 || position.dx > layout.gridRect.bottom + 10) return;
    
    final horizontalAdjoinIndex = layout.gridOffsets[0]
      .indexWhere((item) => item.dx > position.dx);
    final horizontalAdjoinRange = [horizontalAdjoinIndex - 1, horizontalAdjoinIndex];

    final verticalRange = layout.gridOffsets.map((item) => item[0]).toList();
    final verticalAdjoinIndex = verticalRange.indexWhere((item) => item.dy > position.dy);
    final verticalAdjoinRange = [verticalAdjoinIndex - 1, verticalAdjoinIndex];

    if (horizontalAdjoinRange[0] < 0) horizontalAdjoinRange[0] = 0;
    if (verticalAdjoinRange[0] < 0) verticalAdjoinRange[0] = 0;

    if (horizontalAdjoinRange[1] == -1) {
      horizontalAdjoinRange[0] = layout.gridOffsets[0].length - 2;
      horizontalAdjoinRange[1] = layout.gridOffsets[0].length - 1;
    }
    if (verticalAdjoinRange[1] == -1) {
      verticalAdjoinRange[0] = verticalRange.length - 2;
      verticalAdjoinRange[1] = verticalRange.length - 1;
    }

    final adjoinPositions = [
      [
        layout.gridOffsets[verticalAdjoinRange[0]][horizontalAdjoinRange[0]],
        layout.gridOffsets[verticalAdjoinRange[0]][horizontalAdjoinRange[1]],
      ],
      [
        layout.gridOffsets[verticalAdjoinRange[1]][horizontalAdjoinRange[0]],
        layout.gridOffsets[verticalAdjoinRange[1]][horizontalAdjoinRange[1]],
      ]
    ];

    final adjoinPositionIndexs = [
      [
        [verticalAdjoinRange[0], horizontalAdjoinRange[0]],
        [verticalAdjoinRange[0], horizontalAdjoinRange[1]]
      ],
      [
        [verticalAdjoinRange[1], horizontalAdjoinRange[0]],
        [verticalAdjoinRange[1], horizontalAdjoinRange[1]]
      ]
    ];


    final xSpacing = adjoinPositions[0][1].dx - adjoinPositions[0][0].dx;
    final ySpacing = adjoinPositions[1][0].dy - adjoinPositions[0][0].dy;
    final hitHorizontalIndex = position.dx - adjoinPositions[0][0].dx > (xSpacing / 2) ? 1 : 0;
    final hitVerticalIndex = position.dy - adjoinPositions[0][0].dy > (ySpacing / 2) ? 1 : 0;
    
    final hitPosition = adjoinPositionIndexs[hitVerticalIndex][hitHorizontalIndex];

    addPieces(hitPosition[1], hitPosition[0], GameSide.Black);
  }

  addPieces(int x, int y, GameSide side) {
    piecesList[y][x] = Pieces(this, side: side, x: x, y: y);
  }

  @override
  render(Canvas canvas) {    
    layout = drawBackground(canvas, screenSize);
    piecesList.forEach((row) {
      row.forEach((pieces) => pieces?.render(canvas));
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