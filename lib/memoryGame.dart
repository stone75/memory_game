import 'dart:ui';

import 'package:flame/game/base_game.dart';

class MemoryGame extends BaseGame {
  Size screenSize;

  MemoryGame() {
    init();
  }

  void init() {
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xffffff00);
    canvas.drawRect(bgRect, bgPaint);
  }

  void update(double t) {}

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }
}
