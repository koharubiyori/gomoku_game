import 'dart:ui';

BoardLayout drawBackground(Canvas canvas, Size screenSize, {
  double lineWeight = 2
}) {
  final boardSize = screenSize.width;
  final double containerPadding = 20;
  final boardTopOffset = (screenSize.height - boardSize) / 2;
  
  { // 绘制背景
    final bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    final bgPaint = Paint();
    bgPaint.color = Color(0xff3b2e7e);
    canvas.drawRect(bgRect, bgPaint);
  }

  { // 绘制棋盘
    // 绘制背景
    final bgRect = Rect.fromLTWH(0, boardTopOffset, boardSize, boardSize);
    final bgPaint = Paint();
    bgPaint.color = Color(0xffffc773);
    canvas.drawRect(bgRect, bgPaint);

    // 绘制格子
    final double gridSize = (boardSize - (containerPadding * 2)) / 15;

    final linePaint = Paint();
    linePaint.color = Color(0xff5d513c);
    linePaint.strokeWidth = lineWeight;
    
    // 绘制横线
    for (var i=0; i < 16; i++) {
      final xBeginPoint = containerPadding;
      final xEndPoint = boardSize - containerPadding;
      final yPoint = boardTopOffset + i * gridSize + containerPadding;
      
      final aPoint = Offset(xBeginPoint, yPoint);
      final bPoint = Offset(xEndPoint, yPoint);

      canvas.drawLine(aPoint, bPoint, linePaint);
    }
    
    // 绘制竖线
    for (var i=0; i < 16; i++) {
      final xPoint = i * gridSize + containerPadding;
      final yBeginPoint = boardTopOffset + containerPadding;
      final yEndPoint = boardTopOffset + boardSize - containerPadding;
      
      final aPoint = Offset(xPoint, yBeginPoint);
      final bPoint = Offset(xPoint, yEndPoint);

      canvas.drawLine(aPoint, bPoint, linePaint);
    }
  }

  final containerReact = Rect.fromLTWH(0, boardTopOffset, boardSize, boardSize);
  final gridRect = Rect.fromLTWH(
    containerPadding, 
    boardTopOffset + containerPadding, 
    boardSize - containerPadding,
    boardSize - containerPadding,
  );

  final List<List<Offset>> gridOffsets = [];
  for (var i=0; i < 16; i++) {
    final row = <Offset>[];
    gridOffsets.add(row);
    
    for (var j=0; j < 16; j++) {
      final x = gridRect.left + (j * 23.5);
      final y = gridRect.top + (i * 23.5);
      row.add(Offset(x, y));
    }
  }

  return BoardLayout(
    containerRect: containerReact,
    gridRect: gridRect,
    gridOffsets: gridOffsets
  );
}

class BoardLayout {
  final Rect containerRect;
  final Rect gridRect;
  final List<List<Offset>> gridOffsets;

  BoardLayout({
    required this.containerRect,
    required this.gridRect,
    required this.gridOffsets
  });
}