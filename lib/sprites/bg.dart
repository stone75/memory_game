
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:memory_game/memoryGame.dart';

class Background {
  final MemoryGame game;
  Sprite bgSprite;
  Rect bgRect;

  Background(this.game) {
    bgSprite = Sprite('bg/bg.png');
    bgRect = Rect.fromLTWH(
      0, 0, game.screenSize.width, game.screenSize.height
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}