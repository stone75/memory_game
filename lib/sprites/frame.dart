import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:memory_game/memoryGame.dart';

class Frame {
  final MemoryGame game;
  RRect outRRect;

  Paint _paint = Paint()
    ..color = Colors.amber
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5.0;

  Frame(this.game) {
    outRRect = new RRect.fromLTRBR(
      game.frameSize / 2,
      game.frameSize / 2,
      game.screenSize.width - ( game.frameSize / 2 ),
      game.tileHeight * 4 + (game.frameSize * 1.5),
      new Radius.circular(10.0)
    );
  }

  void render(Canvas c) {
    c.drawRRect(outRRect, _paint);
  }

  void update(double t) {}
}
